require 'test_helper'

class CurrencyUpdaterTest < Minitest::Test
  include ActiveJob::TestHelper

  def test
    assert_enqueued_with(job: CurrencyRelay) { CurrencyUpdater.new.perform }
  end
end
