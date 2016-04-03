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

group :development, :test do
  gem 'sqlite3'
  gem 'pry-rails'
end

group :development do
  gem 'foreman', require: false
  gem 'spring'
  gem 'listen', '~> 3.0.5'
  gem 'rubocop', require: false
end

group :development, :production do
  gem 'redis', '~> 3.0'
  gem 'uglifier', '>= 1.3.0'
end

group :production do
  gem 'pg'
  gem 'rails_12factor' # for heroku static files and logging
end
