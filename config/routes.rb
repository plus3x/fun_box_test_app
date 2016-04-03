require 'sidekiq/web'
require 'sidekiq/cron/web'

Sidekiq::Web.use Rack::Auth::Basic, 'Sidekiq monitoring' do |username, password|
  username == ENV['SIDEKIQ_USERNAME'] && password == ENV['SIDEKIQ_PASSWORD']
end

Rails.application.routes.draw do
  # Serve websocket cable requests in-process
  # mount ActionCable.server, at: '/cable'

  mount Sidekiq::Web, at: '/sidekiq'

  root to: 'home#index', as: :home

  resources :currencies, except: %i(index show)

  get 'admin', to: 'currencies#new'
end
