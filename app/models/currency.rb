class Currency < ApplicationRecord
  after_commit do
    view = ApplicationController.renderer.render(self)
    ActionCable.server.broadcast 'currency', partial: view
  end
end
