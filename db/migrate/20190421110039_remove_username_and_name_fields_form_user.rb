class RemoveUsernameAndNameFieldsFormUser < ActiveRecord::Migration[5.2]
  def change
  	remove_column :users, :username
  	remove_column :users, :name
  end
end
