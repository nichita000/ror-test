class ApplicationController < ActionController::Base
	before_action :authenticate_user!
	before_action :set_hostname


	def self.hostname
		@@hostname
	end

	private

		def set_hostname
			port = request.port ? ":#{request.port}" : ""
			@@hostname = "#{request.protocol}#{request.host}#{port}"
		end
end
