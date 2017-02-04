class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street, null: false

      t.timestamps null: false
    end
    add_index :addresses, :street, unique: true
  end
end
