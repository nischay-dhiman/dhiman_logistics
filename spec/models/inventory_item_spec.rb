require 'rails_helper'

RSpec.describe InventoryItem, type: :model do

  before(:each) do
    warehouse = Warehouse.new(
      city: CITIES[0],
      zipcode: "N9B2N6",
      address: "test address",
      contact_number: "2269754175"
    ).save
  end

  it 'creates a warehouse' do
    inventory_item = InventoryItem.new(
      warehouse_id: Warehouse.last.id,
      status: 'Received',
      item_code: 'ABC123',
      price: 100,
      price_per_unit: 100,
      quantity: 100,
      weight: 100,
    )
    expect {inventory_item.save!}.not_to raise_error
  end

  it 'validates presence of warehouse while creating inventory item' do
    inventory_item = InventoryItem.new(
      status: 'Received',
      item_code: 'ABC123',
      price: 100,
      price_per_unit: 100,
      quantity: 100,
      weight: 100,
    )
    expect {inventory_item.save!}.to raise_error(ActiveRecord::RecordInvalid) 
  end


  it 'validates presence of item_code while creating inventory item' do
    inventory_item = InventoryItem.new(
      warehouse_id: Warehouse.last.id,
      status: 'Received',
      price: 100,
      price_per_unit: 100,
      quantity: 100,
      weight: 100,
    )
    expect {inventory_item.save!}.to raise_error(ActiveRecord::RecordInvalid) 
  end



  it 'validates presence of status while creating inventory item' do
    inventory_item = InventoryItem.new(
      warehouse_id: Warehouse.last.id,
      item_code: 'ABC123',
      price: 100,
      price_per_unit: 100,
      quantity: 100,
      weight: 100,
    )
    expect {inventory_item.save!}.to raise_error(ActiveRecord::RecordInvalid) 
  end


  it 'validates presence of price while creating inventory item' do
    inventory_item = InventoryItem.new(
      warehouse_id: Warehouse.last.id,
      status: 'Received',
      item_code: 'ABC123',
      price_per_unit: 100,
      quantity: 100,
      weight: 100,
    )
    expect {inventory_item.save!}.to raise_error(ActiveRecord::RecordInvalid) 
  end


  it 'validates presence of quantity while creating inventory item' do
    inventory_item = InventoryItem.new(
      warehouse_id: Warehouse.last.id,
      status: 'Received',
      item_code: 'ABC123',
      price: 100,
      price_per_unit: 100,
      weight: 100,
    )
    expect {inventory_item.save!}.to raise_error(ActiveRecord::RecordInvalid) 
  end


  it 'validates presence of price_per_unit not required while creating inventory item' do
    inventory_item = InventoryItem.new(
      warehouse_id: Warehouse.last.id,
      status: 'Received',
      item_code: 'ABC123',
      price: 100,
      quantity: 100,
      weight: 100,
    )
    expect {inventory_item.save!}.not_to raise_error
  end


  it 'validates uniqueness of item_code while creating inventory item' do
    InventoryItem.new(
      warehouse_id: Warehouse.last.id,
      status: 'Ready To Ship',
      item_code: 'ABC123',
      price: 12300,
      price_per_unit: 1231,
      quantity: 123,
      weight: 1233312,
    ).save
    
    inventory_item = InventoryItem.new(
      warehouse_id: Warehouse.last.id,
      status: 'Received',
      item_code: 'ABC123',
      price: 100,
      price_per_unit: 100,
      quantity: 100,
      weight: 100,
    )
    expect {inventory_item.save!}.to raise_error(ActiveRecord::RecordInvalid) 
  end

  it 'verifies scope in_warehouse' do
    InventoryItem.create([
      {
        warehouse_id: Warehouse.last.id,
        status: 'Ready To Ship',
        item_code: 'ABC123',
        price: 12300,
        price_per_unit: 1231,
        quantity: 123,
        weight: 1233312
      },
      {
        warehouse_id: Warehouse.last.id,
        status: 'Received',
        item_code: 'ABC124',
        price: 300,
        price_per_unit: 11,
        quantity: 13,
        weight: 312
      }
    ])
    
    expect(InventoryItem.in_warehouse(Warehouse.last.id).count).to eql(2)
  end

  it 'verifies increase in warehouse stock after creation of inventory item' do

    inventory = InventoryItem.new(
      warehouse_id: Warehouse.last.id,
      status: 'Ready To Ship',
      item_code: 'ABC123',
      price: 12300,
      price_per_unit: 1231,
      quantity: 123,
      weight: 1233312
    )

    expect { inventory.save }.to change {Warehouse.last.total_stock}.from(0).to(1)
  end

  it 'verifies decrement in warehouse stock after deletion of inventory item' do
    InventoryItem.create([
      {
        warehouse_id: Warehouse.last.id,
        status: 'Ready To Ship',
        item_code: 'ABC123',
        price: 12300,
        price_per_unit: 1231,
        quantity: 123,
        weight: 1233312
      },
      {
        warehouse_id: Warehouse.last.id,
        status: 'Received',
        item_code: 'ABC124',
        price: 300,
        price_per_unit: 11,
        quantity: 13,
        weight: 312
      }
    ])

    expect { InventoryItem.last.destroy }.to change { Warehouse.last.total_stock }.from(2).to(1)
  end


  it 'verifies decrease in warehouse2 stock after updation of inventory item' do
    warehouse1 = Warehouse.first
    warehouse2 = Warehouse.create(
      city: CITIES[0],
      zipcode: "N9B2N6",
      address: "test address",
      contact_number: "2269754175"
    )

    InventoryItem.create([
      {
        warehouse_id: warehouse1.id,
        status: 'Ready To Ship',
        item_code: 'ABC123',
        price: 12300,
        price_per_unit: 1231,
        quantity: 123,
        weight: 1233312
      },
      {
        warehouse_id: warehouse2.id,
        status: 'Received',
        item_code: 'ABC124',
        price: 300,
        price_per_unit: 11,
        quantity: 13,
        weight: 312
      }
    ])

    expect { InventoryItem.last.update(warehouse_id: warehouse1.id) }.to change { Warehouse.last.total_stock }.from(1).to(0)
  end

  it 'verifies increase in warehouse1 stock after updation of inventory item' do
    warehouse1 = Warehouse.first
    warehouse2 = Warehouse.create(
      city: CITIES[0],
      zipcode: "N9B2N6",
      address: "test address",
      contact_number: "2269754175"
    )

    InventoryItem.create([
      {
        warehouse_id: warehouse1.id,
        status: 'Ready To Ship',
        item_code: 'ABC123',
        price: 12300,
        price_per_unit: 1231,
        quantity: 123,
        weight: 1233312
      },
      {
        warehouse_id: warehouse2.id,
        status: 'Received',
        item_code: 'ABC124',
        price: 300,
        price_per_unit: 11,
        quantity: 13,
        weight: 312
      }
    ])

    expect { InventoryItem.last.update(warehouse_id: warehouse1.id) }.to change { Warehouse.first.total_stock }.from(1).to(2)
  end



end
