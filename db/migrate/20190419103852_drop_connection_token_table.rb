class DropConnectionTokenTable < ActiveRecord::Migration[5.2]
  def change
  	drop_table :connection_tokens
  end
end
