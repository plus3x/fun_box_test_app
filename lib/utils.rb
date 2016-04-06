# :nocov:
module Utils
  def wait_for(error: 'Wait for error: timeout over', timeout: 1.5)
    start = Time.zone.now
    raise error if Time.zone.now > start + timeout until yield
  end
end
