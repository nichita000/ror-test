module Spectre
	class AccountsApi
		include Api

		BASE_API = "accounts"

		def initialize(connection_id)
			@connection_id = connection_id
		end

		def fetch
			get("#{BASE_API}/?connection_id=#{@connection_id}")
		end
	end
end