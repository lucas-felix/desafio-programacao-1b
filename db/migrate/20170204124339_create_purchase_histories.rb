class CreatePurchaseHistories < ActiveRecord::Migration
  def change
    create_table :purchase_histories do |t|
      t.integer :quantity, null: false
      t.text :description, null: false
      t.decimal :item_price, precision: 10, scale: 2, null: false
      t.references :buyer, null: false
      t.references :product, null: false

      t.timestamps null: false
    end
  end
end
