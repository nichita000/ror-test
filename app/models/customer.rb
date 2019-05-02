class Customer < ApplicationRecord
  validates_presence_of :spectre_id, :user_id

  belongs_to :user

  # def connect_session
  #   response = SpectreApiService.connect_session(self.spectre_id)
  #   response = JSON.parse response
  #   response["data"]
  # end

  # def reconnect_session(connection_id)
  #   response = SpectreApiService.reconnect_session(self.spectre_id, connection_id)
  #   response = JSON.parse response
  #   response["data"]
  # end

  # def refresh_session(connection_id)
  #   response = SpectreApiService.refresh_session(connection_id)
  #   response = JSON.parse response
  #   response["data"]
  # end

  # def fetch_connections
  #   response = SpectreApiService.fetch_connections(self.spectre_id)
  #   response = JSON.parse response
  #   response["data"]
  # end

  # def fetch_accounts(connection_id)
  #   response = SpectreApiService.fetch_accounts(connection_id)
  #   response = JSON.parse response
  #   response["data"]
  # end

  # def fetch_transactions(connection_id, account_id)
  #   response = SpectreApiService.fetch_transactions(connection_id, account_id)
  #   response = JSON.parse response
  #   response["data"]
  # end
end
