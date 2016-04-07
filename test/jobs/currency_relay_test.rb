require 'test_helper'

class CurrencyRelayTest < ActiveJob::TestCase
  test 'Must broadcast message' do
    Currency.stubs(:current).returns Currency.new(value: 12.0)
    view = ApplicationController.renderer.render(Currency.current)
    ActionCable.stubs(:server).returns mock.tap { |m| m.expects(:broadcast).with('currency', view) }

    CurrencyRelay.perform_now

    Currency.unstub(:current)
  end
end
