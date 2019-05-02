module Spectre
	class TransactionsApi
		include Api

		BASE_API = "transactions"

		def initialize(connection_id)
			@connection_id = connection_id
		end

		def fetch(account_id)
			get("#{BASE_API}/?connection_id=#{@connection_id}&account_id=#{account_id}")
		end
	end
end