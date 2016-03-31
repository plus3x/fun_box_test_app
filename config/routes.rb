Rails.application.routes.draw do
  root to: 'home#index', as: :home

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
