class DeleteCustomerSessionsTable < ActiveRecord::Migration[5.2]
  def change
  	drop_table :customer_sessions
  end
end
