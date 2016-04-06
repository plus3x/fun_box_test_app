source 'https://rubygems.org'
ruby '2.3.0'

gem 'rails', '>= 5.0.0.beta3', '< 5.1'
gem 'puma'
gem 'sass-rails', '~> 5.0'
gem 'bootstrap-sass', '~> 3.3'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks', '~> 5.x'
gem 'haml-rails'
# gem 'jbuilder', '~> 2.0'
# gem 'bcrypt', '~> 3.1.7'
gem 'sidekiq'
gem 'sidekiq-cron'

# FIXME: Wait version supporting Rack 2
gem 'sinatra', require: false, github: 'sinatra/sinatra', branch: 'master'

group :cucumber do
  gem 'cucumber-rails'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'poltergeist', require: false
  gem 'capybara-webkit', require: false
  gem 'selenium-webdriver', require: false
end

gem 'simplecov', require: false, group: %i(cucumber test)

group :test do
  gem 'mocha'
  gem 'rails-controller-testing'
end

group :development, :test do
  gem 'sqlite3'
  gem 'pry-rails'
  gem 'rubocop', require: false
end

group :development do
  gem 'foreman', require: false
  gem 'spring'
  gem 'listen', '~> 3.0.5'
end

group :development, :production do
  gem 'rails_12factor'
  gem 'redis', '~> 3.0'
  gem 'uglifier', '>= 1.3.0'
end

group :production do
  gem 'pg'
end
