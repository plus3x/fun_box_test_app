Sidekiq::Cron::Job.load_from_hash YAML.load_file('config/schedule.yml')

require 'sidekiq/web'
require 'sidekiq/cron/web'

Sidekiq::Web.use Rack::Auth::Basic, 'Sidekiq monitoring' do |username, password|
  username == ENV['SIDEKIQ_USERNAME'] && password == ENV['SIDEKIQ_PASSWORD']
end
