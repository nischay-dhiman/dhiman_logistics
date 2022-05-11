class CreateWarehouses < ActiveRecord::Migration[7.0]
  def change
    create_table :warehouses do |t|
      t.string :city
      t.text :address
      t.string :zipcode
      t.string :contact_number
      t.integer :total_stock, default: 0

      t.timestamps
    end
  end
end
