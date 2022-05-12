module InventoryItemsHelper

  def warehouses_for_select
    Warehouse.all.collect do |warehouse| 
      ["#{warehouse.info}", warehouse.id]
    end
  end

end
