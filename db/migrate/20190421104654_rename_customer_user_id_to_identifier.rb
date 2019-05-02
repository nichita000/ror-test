class RenameCustomerUserIdToIdentifier < ActiveRecord::Migration[5.2]
  def change
  	rename_column :customers, :user_id, :identifier
  end
end
