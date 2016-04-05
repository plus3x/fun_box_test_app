Rails.application.routes.draw do
  mount ActionCable.server, at: '/cable'
  mount Sidekiq::Web, at: '/sidekiq'

  root to: 'home#index', as: :home

  resources :currencies, only: %i(new create update)

  get 'admin', to: 'currencies#new'
end
