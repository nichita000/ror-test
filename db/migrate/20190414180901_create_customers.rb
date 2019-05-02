class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :spectre_id
      t.integer :user_id

      t.timestamps
    end
  end
end
