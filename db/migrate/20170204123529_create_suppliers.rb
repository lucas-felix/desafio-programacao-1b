class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :name, null: false

      t.timestamps null: false
    end
    add_index :suppliers, :name, unique: true
  end
end
