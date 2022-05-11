class WarehousesController < ApplicationController
  before_action :set_warehouse, only: %i[ show edit update destroy ]

  # GET /warehouses
  def index
    @warehouses = Warehouse.all
  end

  # GET /warehouses/1
  def show
    @warehouse_inventory = @warehouse.inventory_items
  end

  # GET /warehouses/new
  def new
    @warehouse = Warehouse.new
  end

  # GET /warehouses/1/edit
  def edit
  end

  # POST /warehouses
  def create
    @warehouse = Warehouse.new(warehouse_params)

    respond_to do |format|
      if @warehouse.save
        format.html { redirect_to warehouse_url(@warehouse), notice: "Warehouse was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /warehouses/1
  def update
    respond_to do |format|
      if @warehouse.update(warehouse_params)
        format.html { redirect_to warehouse_url(@warehouse), notice: "Warehouse was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /warehouses/1
  def destroy
    @warehouse.destroy

    respond_to do |format|
      format.html { redirect_to warehouses_url, notice: "Warehouse was successfully destroyed." }
    end
  end

  private

    def set_warehouse
      @warehouse = Warehouse.find(params[:id])
    end

    def warehouse_params
      params.require(:warehouse).permit(:city, :zipcode, :address, :contact_number)
    end
end
