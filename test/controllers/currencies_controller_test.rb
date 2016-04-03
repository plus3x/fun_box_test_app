require 'test_helper'

class CurrenciesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @currency = currencies(:one)
  end

  test 'should get new' do
    get new_currency_url
    assert_response :success
  end

  test 'should create currency' do
    assert_difference 'Currency.count' do
      post currencies_url, params: { currency: { date: @currency.date, value: @currency.value } }
    end

    assert_redirected_to currency_path(Currency.last)
  end

  test 'should get edit' do
    get edit_currency_url(@currency)
    assert_response :success
  end

  test 'should update currency' do
    patch currency_url(@currency), params: { currency: { date: @currency.date, value: @currency.value } }
    assert_redirected_to currency_path(@currency)
  end

  test 'should destroy currency' do
    assert_difference 'Currency.count', -1 do
      delete currency_url(@currency)
    end

    assert_redirected_to currencies_path
  end
end
