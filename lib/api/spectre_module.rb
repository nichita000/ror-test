module RestApi
	module SpectreApi

		def self.create_customer(identifier)
			body = { data: { identifier: identifier } }
			response = post("/customers", body)
		end
	end
end



# def self.create_customer(identifier)
  #   body = { data: { identifier: identifier } }.to_json

  #   response = RestClient.post("#{API_URL}/customers", body, headers)
  #   response = JSON.parse(response)
  #   response = response['data']

  #   { spectre_id: response['id'], identifier: identifier }
  # end