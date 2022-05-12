require 'rails_helper'

RSpec.describe InventoryItemsController, type: :controller do
  describe "GET /inventory_items" do
    it "list inventory items" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET /inventory_items/new" do
    it "new page for inventory item creation" do
      get :new
      expect(response).to be_successful
    end
  end


end
