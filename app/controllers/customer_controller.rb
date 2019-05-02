class CustomerController < ApplicationController

	def index
		@customer = current_user.customer
		@connections = Spectre::ConnectionsApi.new(@customer.spectre_id).fetch
	end

	def connect_session
		@customer = current_user.customer
		session = Spectre::ConnectionsApi.new(@customer.spectre_id).create

		redirect_to session["connect_url"]
	end

  def reconnect_session
    @customer = current_user.customer
    session = Spectre::ConnectionsApi.new(@customer.spectre_id).reconnect(params[:connection_id])

    redirect_to session["connect_url"]
  end

  def refresh_session
    @customer = current_user.customer
    session = Spectre::ConnectionsApi.new.refresh(params[:connection_id])

    redirect_to session["connect_url"]
  end

  def destroy_session
  	@customer = current_user.customer
  	destroy = Spectre::ConnectionsApi.new.destroy(params[:connection_id], @customer.secret, params[:connection_secret])
  	
  	redirect_to root_path
  end

	def accounts
    	@accounts = Spectre::AccountsApi.new(params[:connection_id]).fetch
	end

  def transactions
    @transactions = Spectre::TransactionsApi.new(params[:connection_id]).fetch(params[:account_id])
  end
end
