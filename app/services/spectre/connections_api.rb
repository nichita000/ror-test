module Spectre
	class ConnectionsApi
		include Api

		BASE_API = "connect_sessions"

		def initialize(customer_id=nil)
			@customer_id = customer_id
		end

		def create
			body = Mapper::Connections.create(@customer_id)

			post("#{BASE_API}/create", body)
		end

		def reconnect(connection_id)
			body = Mapper::Connections.reconnect(@customer_id, connection_id)

			post("#{BASE_API}/reconnect", body)
		end

		def refresh(connection_id)
			body = Mapper::Connections.refresh(connection_id)

			post("#{BASE_API}/refresh", body)
		end

		def fetch
			get("connections/?customer_id=#{@customer_id}")
		end

		def destroy(connection_id, customer_secret, connection_secret)
			headers = {
				"Customer-secret" => customer_secret,
				"Connection-secret" => connection_secret
			}

			delete("connections/#{connection_id}", headers: headers)
		end
	end
end