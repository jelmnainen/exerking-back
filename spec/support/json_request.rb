module JsonRequestHelpers
  def get(*args)
    super(*json_args(*args))
  end

  def post(*args)
    super(*json_args(*args))
  end

  def update(*args)
    super(*json_args(*args))
  end

  def patch(*args)
    super(*json_args(*args))
  end

  def put(*args)
    super(*json_args(*args))
  end

  def delete(*args)
    super(*json_args(*args))
  end

  def json_args(path, params = {}, headers = {})
    headers ||= {}
    default_headers = {
      'CONTENT_TYPE' => 'application/json',
      'ACCEPT' => 'application/json',
    }
    [path, params.to_json, default_headers.merge(headers)]
  end
end

RSpec.configure do |config|
  config.include JsonRequestHelpers, type: :request
end
