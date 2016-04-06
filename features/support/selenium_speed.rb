if ENV['DRIVER'] == 'selenium'
  require 'selenium-webdriver'

  Selenium::WebDriver::Remote::Bridge.class_eval do
    def execute(*args)
      sleep ENV['SELENIUM_SPEED'].to_f
      raw_execute(*args)['value']
    end
  end
end
