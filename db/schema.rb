# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_05_10_212724) do
  create_table "inventory_items", force: :cascade do |t|
    t.integer "warehouse_id", null: false
    t.string "status"
    t.string "item_code"
    t.float "price"
    t.float "price_per_unit"
    t.integer "quantity"
    t.integer "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_code"], name: "index_inventory_items_on_item_code", unique: true
    t.index ["status"], name: "index_inventory_items_on_status"
    t.index ["warehouse_id"], name: "index_inventory_items_on_warehouse_id"
  end

  create_table "warehouses", force: :cascade do |t|
    t.string "city"
    t.text "address"
    t.string "zipcode"
    t.string "contact_number"
    t.integer "total_stock", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "inventory_items", "warehouses"
end
