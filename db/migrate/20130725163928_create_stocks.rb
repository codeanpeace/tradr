class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.references :user
      t.string :symbol
      t.integer :quantity
      t.float :starting_price

      t.timestamps
    end
    add_index :stocks, :user_id
  end
end
