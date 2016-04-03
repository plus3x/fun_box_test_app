Rails.application.routes.draw do
  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'

  root to: 'home#index', as: :home

  resources :currencies, except: %i(index show)

  get 'admin', to: 'currencies#new'
end
