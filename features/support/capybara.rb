require 'selenium-webdriver'

browser = (ENV['BROWSER'] || :firefox).to_sym

Selenium::WebDriver::Chrome::Service.executable_path = '/usr/local/bin/chromedriver' if browser == :chrome

Capybara.register_driver :selenium do |app|
  client = Selenium::WebDriver::Remote::Http::Default.new
  client.timeout = 120.seconds if browser == :safari
  Capybara::Selenium::Driver.new(app, browser: browser, http_client: client)
end

Capybara.javascript_driver = Capybara.default_driver = :selenium

Capybara.configure do |config|
  config.run_server = false
  config.app_host = 'http://localhost:3000'
end
