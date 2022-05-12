require 'rails_helper'

RSpec.describe Warehouse, type: :model do

  it 'creates a warehouse' do
    warehouse = Warehouse.new(
      city: CITIES[0],
      zipcode: "N9B2N6",
      address: "test address",
      contact_number: "2269754175"
    )
    expect {warehouse.save!}.not_to raise_error
  end

  it 'fails creation of warehouse' do
    expect {Warehouse.create!}.to raise_error(ActiveRecord::RecordInvalid) 
  end

  it 'validates zipcode length' do
    warehouse = Warehouse.new(
      city: CITIES[0],
      zipcode: "N9B2N666",
      address: "test address",
      contact_number: "2269754175"
    )
    expect {warehouse.save!}.to raise_error(ActiveRecord::RecordInvalid) 
  end

  it 'validates zipcode presence' do
    warehouse = Warehouse.new(
      city: CITIES[0],
      address: "test address",
      contact_number: "2269754175"
    )
    expect {warehouse.save!}.to raise_error(ActiveRecord::RecordInvalid) 
  end

  it 'validates city' do
    warehouse = Warehouse.new(
      zipcode: "N9B2N6",
      address: "test address",
      contact_number: "2269754175"
    )
    expect {warehouse.save!}.to raise_error(ActiveRecord::RecordInvalid) 
  end

  it 'validates contact_number length' do
    warehouse = Warehouse.new(
      city: CITIES[0],
      zipcode: "N9B2N6",
      address: "test address",
      contact_number: "2269"
    )
    expect {warehouse.save!}.to raise_error(ActiveRecord::RecordInvalid) 
  end

  it 'validates contact_number numeric condition' do
    warehouse = Warehouse.new(
      city: CITIES[0],
      zipcode: "N9B2N6",
      address: "test address",
      contact_number: "2asdasd269as"
    )
    expect {warehouse.save!}.to raise_error(ActiveRecord::RecordInvalid) 
  end

  it 'validates contact_number presence' do
    warehouse = Warehouse.new(
      city: CITIES[0],
      zipcode: "N9B2N6",
      address: "test address"
    )
    expect {warehouse.save!}.to raise_error
  end

  it 'verifies info content' do
    warehouse = Warehouse.new(
      city: CITIES[0],
      zipcode: "N9B2N6",
      address: "test address",
      contact_number: "2269754175"
    )

    expeted_info = [warehouse.address, warehouse.city, warehouse.zipcode].join(",")

    expect(warehouse.info).to eql(expeted_info)
  end
end
