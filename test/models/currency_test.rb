require 'test_helper'

class CurrencyTest < ActiveSupport::TestCase
  test '#current' do
    Currency.last.update to: 12.minutes.from_now, value: 13.0

    assert_equal Currency.current.value, 13.0

    Currency.last.update to: 1.minute.ago

    Currency.stubs(:current_currency).returns 12.0

    assert_equal Currency.current.value, 12.0
  end
end
