class ChangeCustomerIdentifierToBeString < ActiveRecord::Migration[5.2]
  def change
  	change_column :customers, :identifier, :string
  end
end
