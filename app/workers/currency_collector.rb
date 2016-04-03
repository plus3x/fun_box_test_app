class CurrencyCollector
  include Sidekiq::Worker

  TOKEN = ENV['XIGNITE_TOKEN']
  SYMBOL = 'USDRUB'.freeze
  SITE = 'http://globalcurrencies.xignite.com'.freeze

  def perform
    uri = URI("#{SITE}/xGlobalCurrencies.json/GetRealTimeRate")
    uri.query = "Symbol=#{SYMBOL}&_token=#{TOKEN}"

    data = JSON.parse(Net::HTTP.get(uri))

    Currency.find_or_create_by!(date: data['Date']) { |c| c.value = data['Ask'] }
  end
end
