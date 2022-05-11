class CreateInventoryItems < ActiveRecord::Migration[7.0]
  def change
    create_table :inventory_items do |t|
      t.references :warehouse, null: false, foreign_key: true
      t.string :status, index: true
      t.string :item_code, index: { unique: true }
      t.float :price
      t.float :price_per_unit
      t.integer :quantity
      t.integer :weight

      t.timestamps
    end
  end
end
