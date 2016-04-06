if ENV['COVERAGE']
  require 'simplecov'

  SimpleCov.start :rails do
    coverage_dir 'tmp/coverage/minitest'
    minimum_coverage 90
    maximum_coverage_drop 1
    add_group 'Workers', 'app/workers'
    add_filter '/lib'
  end
end

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'mocha/setup'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
