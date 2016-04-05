require 'test_helper'

class CurrenciesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @currency = currencies(:one)
  end

  test 'should get new' do
    get new_currency_url
    assert_response :success
  end

  test 'should create currency via ajax' do
    assert_difference 'Currency.count' do
      post currencies_url, xhr: true, params: { currency: { to: @currency.to, value: @currency.value } }
    end
    assert_response :success
  end

  test 'should update currency via ajax' do
    patch currency_url(@currency), xhr: true, params: { currency: { to: @currency.to, value: @currency.value } }
    assert_response :success
  end
end
