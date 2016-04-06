Before do
  visit '/'
end

if %w(safari chrome).include?(ENV['BROWSER'])
  # Patch https://github.com/jnicklas/capybara/blob/master/lib/capybara/cucumber.rb#L8
  module Capybara
    def self.reset_sessions!() end
  end
  # REMEMBER: In safari browser not work default session and cookie clearing

  After do
    on(ApplicationLayout).sign_out_if_active
  end
end

if ENV['SCREENSHOTS'] == 'true'
  SCREENSHOTS_PATH = ENV['SCREENSHOTS_PATH'] || 'screenshots/'

  After do |scenario|
    scenario_name, feature_name =
      if scenario.respond_to?(:scenario_outline)
        [scenario.scenario_outline.name, scenario.scenario_outline.feature.name]
      else
        [scenario.name, scenario.feature.name]
      end
    file_name = (feature_name.downcase + '_' + scenario_name.downcase).parameterize + '.png'
    full_path = SCREENSHOTS_PATH + file_name
    page.save_screenshot(full_path) if scenario.failed?
  end
end
