if ENV['COVERAGE']
  require 'simplecov'

  SimpleCov.start :rails do
    coverage_dir 'tmp/coverage/cucumber'
    minimum_coverage 23
    maximum_coverage_drop 1
  end
end
