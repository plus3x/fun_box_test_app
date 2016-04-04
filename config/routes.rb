Rails.application.routes.draw do
  mount ActionCable.server, at: '/cable'
  mount Sidekiq::Web, at: '/sidekiq'

  root to: 'home#index', as: :home

  resources :currencies, except: %i(index show)

  get 'admin', to: 'currencies#new'
end
