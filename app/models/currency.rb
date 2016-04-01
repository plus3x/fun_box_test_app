class Currency
  TOKEN = ENV['XIGNITE_TOKEN']
  SITE = 'http://globalcurrencies.xignite.com'.freeze

  def self.get(symbol = 'USDRUB', date: Date.current)
    uri = URI("#{SITE}/xGlobalCurrencies.json/GetRealTimeRate")
    uri.query = "Symbol=#{symbol}&_token=#{TOKEN}&Date=#{date.strftime('%m/%d/%Y')}"

    response = Net::HTTP.get(uri)

    format '%.2f', JSON.parse(response)['Ask']
  end
end
