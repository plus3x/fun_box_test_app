class CurrencyWorker
  include Sidekiq::Worker

  def perform
    CurrencyRelay.perform_later
  end
end
