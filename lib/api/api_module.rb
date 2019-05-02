require "rest-client"

module Api
	API_URL = ENV["API_URL"]
	DEFAULT_HEADERS = {
    accepts: "application/json",
    content_type: "application/json",
    "App-id" => ENV["APP_ID"],
    "Secret" => ENV["SECRET"]
	}


	def get(url, params={})
		wrap_request do
			RestClient.get("#{API_URL}#{url}", params, DEFAULT_HEADERS)
		end
	end

	def post(url, body)
    wrap_request do
      RestClient.post("#{API_URL}#{url}", body, DEFAULT_HEADERS)
    end
	end

  private

    def wrap_request
    	begin
    		response = yield
    		resopnse = JSON.parse(response)
    		response["data"]
    	raise RestClient::ErrorWithResponse => err
    		err.response
    	end
    end

end