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
    assert_template :success

    assert_no_difference 'Currency.count' do
      post currencies_url, xhr: true, params: { currency: { to: @currency.to, value: '' } }
    end
    assert_template :error
  end

  test 'should update currency via ajax' do
    patch currency_url(@currency), xhr: true, params: { currency: { to: @currency.to, value: @currency.value } }
    assert_template :success

    patch currency_url(@currency), xhr: true, params: { currency: { to: @currency.to, value: '' } }
    assert_template :error
  end
end
