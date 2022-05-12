class InventoryItem < ApplicationRecord
  # Associations
  belongs_to :warehouse, inverse_of: :inventory_items

  # Callbacks
  before_update :update_warehouse_stocks, if: :warehouse_changed?
  after_create :increase_warehouse_stocks
  after_destroy :delete_warehouse_stocks

  # Validations
  validates_presence_of :price, :quantity, :status, :item_code
  validates_uniqueness_of :item_code

  scope :in_warehouse, ->(warehouse_id) { where(warehouse_id: warehouse_id) if warehouse_id.present? }

  def update_warehouse_stocks
    Warehouse.find_by(id: warehouse_id_was)&.decrement!(:total_stock)
    warehouse&.increment!(:total_stock)
  end

  def increase_warehouse_stocks
    warehouse.increment!(:total_stock)
  end

  def delete_warehouse_stocks
    warehouse.decrement!(:total_stock)
  end

end
