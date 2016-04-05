class CurrencyUpdater
  include Sidekiq::Worker

  def perform
    CurrencyRelay.perform_later Currency.current
  end
end
