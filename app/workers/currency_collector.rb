class CurrencyCollector
  include Sidekiq::Worker

  HOST = URI('http://cbr.ru')

  def perform
    value = Net::HTTP.get(HOST)[%r{</i>(.*)</div}, 1]

    Currency.create!(value: value)
  end
end
