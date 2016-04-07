# :nocov:
class PageObject
  include Capybara::DSL
  include Utils

  def active?
    return true if distinctive_elements.empty?

    distinctive_elements.all? { |name| send "#{name}?" }
  end

  def verify_active
    wait_for(error: "#{self.class.name} is not active") { active? }
  end

  def verify_no_active
    wait_for(error: "#{self.class.name} is still active") { !active? }
  end

  private

  def distinctive_elements
    @distinctive_elements ||=
      begin
        self.class.constants
            .grep(/_DISTINCTIVE_ELEMENTS\z/)
            .map { |const| self.class.const_get(const) }
            .flatten
      rescue NameError
        []
      end
  end

  class << self
    TAGS = %i(field button link form header select).freeze
    CLICKABLE_TAGS = %i(button link).freeze
    WRITEBLE_TAGS = %i(field).freeze
    TAG_ALIASES = {
      field: ['input'],
      button: %w(input a button),
      link: ['a'],
      header: %w(h1 h2 h3 h4)
    }.freeze
    TAG_TYPES = {
      field: %w(text email password),
      button: ['', 'button']
    }.freeze

    def define_xpath_method(tag, name, options)
      xpath = options[:xpath] || xpath_from(tag, options)

      define_method("#{name}_xpath") do
        xpath
      end
    end

    def define_element_method(name)
      define_method("#{name}_element") do
        find :xpath, send("#{name}_xpath")
      end
    end

    def define_existing_method(name)
      define_method("#{name}?") do
        has_xpath? send("#{name}_xpath")
      end
    end

    def define_click_method(name)
      define_method(name.to_s) do
        send("#{name}_element").click
      end
    end

    def define_write_method(name)
      define_method("#{name}=") do |value|
        send("#{name}_element").set(value)
      end
    end

    def define_read_method(name)
      define_method(name.to_s) do
        send("#{name}_element").text
      end
    end

    def define_optional_method(tag, name)
      case tag
      when *CLICKABLE_TAGS  then define_click_method(name)
      when *WRITEBLE_TAGS   then define_write_method(name)
      else
        define_read_method(name)
      end
    end

    def distinctive_elements
      const_name = "#{name.upcase}_DISTINCTIVE_ELEMENTS"
      const_set(const_name, []) unless const_defined?(const_name)
      const_get(const_name)
    end

    def xpath_from(tag, options)
      finder_matcher = "[@#{options.keys.first}='#{options.values.first}']"
      type_matcher   = "[@type = ('#{TAG_TYPES[tag].join("' or '")}')]" if TAG_TYPES[tag]
      tag_matcher    = "[local-name()='#{tag}']"
      tag_matcher    = "[local-name() = ('#{TAG_ALIASES[tag].join("' or '")}')]" if TAG_ALIASES[tag]

      ['//*', tag_matcher, type_matcher, finder_matcher].join
    end

    TAGS.each do |tag|
      define_method(tag) do |name, options|
        distinctive_elements << name if options.delete(:distinctive)

        define_xpath_method(tag, name, options)
        define_element_method(name)
        define_existing_method(name)
        define_optional_method(tag, name)
      end
    end
  end
end

Dir[Rails.root.join('lib/page_objects/**/*.rb')].each(&method(:require))
