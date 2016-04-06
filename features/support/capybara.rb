if ENV['DRIVER'] || ENV['BROWSER']
  driver = (ENV['DRIVER'] || :selenium).to_sym
  browser = (ENV['BROWSER'] || :firefox).to_sym

  case driver
  when :selenium
    require 'selenium-webdriver'

    Selenium::WebDriver::Chrome::Service.executable_path = '/usr/local/bin/chromedriver' if browser == :chrome

    # Port polling cycle
    sleep ENV['TEST_ENV_NUMBER'].to_i if browser == :safari

    Capybara.register_driver :selenium do |app|
      client = Selenium::WebDriver::Remote::Http::Default.new
      client.timeout = 120.seconds if browser == :safari
      Capybara::Selenium::Driver.new(app, browser: browser, http_client: client)
    end
  when :webkit
    require 'capybara/webkit'
  when :poltergeist
    require 'capybara/poltergeist'

    Capybara.register_driver :poltergeist do |app|
      Capybara::Poltergeist::Driver.new(app, timeout: 15, debug: true, js_errors: false)
    end
  end

  Capybara.javascript_driver = Capybara.default_driver = driver
else
  require 'capybara/poltergeist'
  Capybara.javascript_driver = :poltergeist
end
