class CurrencyRelay < ApplicationJob
  def perform(currency)
    view = ApplicationController.renderer.render(currency)

    ActionCable.server.broadcast 'currency', view
  end
end
