class AddCustomerSecretFieldToCustomer < ActiveRecord::Migration[5.2]
  def change
  	add_column :customers, :secret, :string
  end
end
