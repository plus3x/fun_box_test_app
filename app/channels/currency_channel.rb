class CurrencyChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'currency'
  end
end
