require "rest-client"

module Api
  API_URL = ENV["API_URL"]
  DEFAULT_HEADERS = {
    "Accepts" => "application/json",
    "Content-Type" => "application/json",
    "App-id" => ENV["APP_ID"],
    "Secret" => ENV["SECRET"]
  }

  def get(url, config={})
    wrap_request(config) do |headers|
      RestClient.get("#{API_URL}/#{url}", headers)
    end
  end

  def post(url, body, config={})
    wrap_request(config) do |headers|
      RestClient.post("#{API_URL}/#{url}", body, headers)
    end
  end

  def delete(url, config={})
    wrap_request(config) do |headers|
      RestClient.delete("#{API_URL}/#{url}", headers)
    end
  end

  private

    def wrap_request(config)
      headers = config[:headers] ? DEFAULT_HEADERS.merge(config[:headers]) : DEFAULT_HEADERS

      begin
        response = yield(headers)
        response = JSON.parse(response)
        response["data"]
      rescue => err
        raise err.response
      end
    end

end