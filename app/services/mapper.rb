# In order to not to harcode all request default params
# and modifiers we are keeping those methods here.

module Mapper

  HOSTNAME = ApplicationController.hostname

	module Customer

		def self.create(identifier)
			raise_argument_error if identifier.nil?

			{ data: { identifier: identifier } }
		end

    def self.response_to_customer(response)
      raise_argument_error if response.nil?

      {
        spectre_id: response["id"],
        identifier: response["identifier"],
        secret: response["secret"]
      }
    end
	end

	module Connections

		def self.create(customer_id)
			raise_argument_error if customer_id.nil?

      {
        data: {
          customer_id: customer_id,
          consent: {
            scopes: ["account_details", "transactions_details"]
          },
          attempt: { return_to: "http://localhost:3000" } 
        }
      }
		end

    def self.reconnect(customer_id, connection_id)
      raise_argument_error if customer_id.nil? or connection_id.nil?

      {
        data: {
          customer_id: customer_id,
          connection_id: connection_id,
          consent: { scopes: ["account_details", "transactions_details"] },
          attempt: {
            fetch_scopes: ["accounts", "transactions"],
            return_to: "http://localhost:3000"
          }
        }
      }
    end

    def self.refresh(connection_id)
      raise_argument_error if connection_id.nil?

      {
        data: {
          connection_id: connection_id,
          attempt: { return_to: "http://localhost:3000" }
        }
      }
    end
	end

	private

		def raise_argument_error
			raise ArgumentError, "Listed arguments are missed: #{caller_args[1].join(", ")}"
		end
end