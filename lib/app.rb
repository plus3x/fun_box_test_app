# :nocov:
module App
  include Utils

  def on(page)
    if block_given?
      yield page.new
    else
      page.new
    end
  end
end
