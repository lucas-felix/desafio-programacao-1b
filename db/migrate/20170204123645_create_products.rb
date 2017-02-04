class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.text :description, null: false
      t.decimal :item_price, precision: 10, scale: 2, null: false
      t.references :supplier

      t.timestamps null: false
    end
  end
end
