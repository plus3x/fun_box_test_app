require 'test_helper'

class CurrencyWorkerTest < ActiveSupport::TestCase
  include ActiveJob::TestHelper

  test 'Must relay currency on perform' do
    assert_enqueued_with(job: CurrencyRelay) { CurrencyWorker.new.perform }
  end
end
