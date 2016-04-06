require 'bundler'

ENV['RAILS_ENV'] = 'test'

Bundler.require(:cucumber)

require_relative '../../lib/utils'
require_relative '../../lib/app'
require_relative '../../lib/page_object'

ActionController::Base.allow_rescue = false
Cucumber::Rails::Database.javascript_strategy = :truncation

World(App)
