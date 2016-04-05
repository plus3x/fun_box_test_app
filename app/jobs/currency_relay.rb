class CurrencyRelay < ApplicationJob
  def perform
    view = ApplicationController.renderer.render(Currency.current)

    ActionCable.server.broadcast 'currency', view
  end
end
