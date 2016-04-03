class Currency < ApplicationRecord
  TOKEN = ENV['XIGNITE_TOKEN']
  SYMBOL = 'USDRUB'.freeze
  SITE = 'http://globalcurrencies.xignite.com'.freeze

  after_initialize :set_value_if_empty

  private

  def set_value_if_empty
    return if value

    self.date ||= Date.current

    uri = URI("#{SITE}/xGlobalCurrencies.json/GetRealTimeRate")
    uri.query = "Symbol=#{SYMBOL}&_token=#{TOKEN}&Date=#{date.strftime('%m/%d/%Y')}"

    response = Net::HTTP.get(uri)

    self.value = JSON.parse(response)['Ask']
  end
end
