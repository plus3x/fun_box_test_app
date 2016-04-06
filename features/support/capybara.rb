driver = ENV['DRIVER'] || 'poltergeist'

if driver == 'selenium'
  require 'selenium-webdriver'

  browser = (ENV['BROWSER'] || :firefox).to_sym

  Selenium::WebDriver::Chrome::Service.executable_path = '/usr/local/bin/chromedriver' if browser == :chrome

  # Port polling cycle
  sleep ENV['TEST_ENV_NUMBER'].to_i if browser == :safari

  Capybara.register_driver :selenium do |app|
    client = Selenium::WebDriver::Remote::Http::Default.new
    client.timeout = 120.seconds if browser == :safari
    Capybara::Selenium::Driver.new(app, browser: browser, http_client: client)
  end
else
  require 'capybara/poltergeist'

  Capybara.register_driver :poltergeist do |app|
    Capybara::Poltergeist::Driver.new(app,
                                      timeout: 15,
                                      debug: ENV['POLTERGEIST_DEBUG'] == 'true',
                                      js_errors: ENV['POLTERGEIST_JS_ERRORS'] != 'false')
  end
end

Capybara.javascript_driver = Capybara.default_driver = driver.to_sym
