class RegistrationsController < Devise::RegistrationsController

	after_action :add_customer, only: :create

	private

		def add_customer
      identifier = "#{current_user.user_id}::#{current_user.email}"
      response = Spectre::CustomerApi.new(identifier).request_customer
      @customer = Mapper::Customer.response_to_customer(response)

      current_user.build_customer(@customer)
      current_user.save!
		end
end