require 'bundler'

ENV['RAILS_ENV'] = 'test'

Bundler.require(:cucumber)

require_relative '../../lib/utils'
require_relative '../../lib/app'
require_relative '../../lib/page_object'

ActionController::Base.allow_rescue = false

# remove DatabaseCleaner calling
class Cucumber::Rails::Database::Strategy
  def before_js(_)
  end

  def after
  end
end

World(App)
