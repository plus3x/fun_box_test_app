# :nocov:
module CurrencyPartial
  def currency
    find(:xpath, '//div[@id="currency"]/span').text[%r{(.*) RUB/USD}, 1].to_f
  end

  def verify_currency_equal(expected_currency)
    actual_currency = currency

    if actual_currency != expected_currency
      raise "Expect currency is #{expected_currency}, but actual #{actual_currency}"
    end
  end

  def verify_currency_not_equal(expected_currency)
    raise "Expect currency is not #{expected_currency}" if currency == expected_currency
  end
end
