require 'test_helper'

class CurrencyRelayTest < ActiveJob::TestCase
  test 'Must broadcast message' do
    view = ApplicationController.renderer.render(Currency.current)
    ActionCable.stubs(:server).returns mock.tap { |m| m.expects(:broadcast).with('currency', view) }

    CurrencyRelay.perform_now
  end
end
