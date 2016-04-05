class Currency < ApplicationRecord
  validates :value, :to, presence: true

  after_commit { CurrencyRelay.perform_later Currency.current }

  class << self
    def current
      if where("'to' > ?", Time.zone.now).exists?
        last
      else
        new(value: current_currency)
      end
    end

    private

    def current_currency
      Net::HTTP.get(URI('http://cbr.ru'))[%r{</i>(.*)</div}, 1]
    end
  end
end
