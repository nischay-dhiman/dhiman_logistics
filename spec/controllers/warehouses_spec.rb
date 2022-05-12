require 'rails_helper'

RSpec.describe WarehousesController, type: :controller do
  describe "GET /warehouses" do
    it "list warehouses" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET /warehouses/new" do
    it "new page for warehouse creation" do
      get :new
      expect(response).to be_successful
    end
  end
end
