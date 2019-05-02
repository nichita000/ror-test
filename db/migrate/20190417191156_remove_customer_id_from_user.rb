class RemoveCustomerIdFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :customer_id, :integer
  end
end
