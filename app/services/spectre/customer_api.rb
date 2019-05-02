module Spectre
	class CustomerApi
		include Api

		BASE_API = "customers"

		def initialize(identifier)
			@identifier = identifier
		end

		def request_customer
			response = post(BASE_API, Mapper::Customer.create(@identifier))
			puts "response #{response} identifier #{@identifier}"
			response
		end
	end
end