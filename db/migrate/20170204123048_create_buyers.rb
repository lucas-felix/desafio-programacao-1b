class CreateBuyers < ActiveRecord::Migration
  def change
    create_table :buyers do |t|
      t.string :name, null: false
      t.references :address, null: false

      t.timestamps null: false
    end
    add_index :buyers, :name, unique: true
  end
end
