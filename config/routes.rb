Rails.application.routes.draw do
  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'

  root to: 'home#index', as: :home
end
