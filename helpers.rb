module Helpers
  private

  def env
    Config.env
  end

  def production?
    Config.production?
  end

  def development?
    Config.development?
  end

  def test?
    Config.test?
  end

  def json_body
    request.body.rewind
    JSON.parse(request.body.read)
  end
end