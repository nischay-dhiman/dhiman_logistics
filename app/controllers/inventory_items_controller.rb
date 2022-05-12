class InventoryItemsController < ApplicationController
  before_action :set_inventory_item, only: %i[ show edit update destroy ]

  # GET /inventory_items
  def index
    @inventory_items = InventoryItem.in_warehouse(filter_params[:warehouse_id])
  end

  # GET /inventory_items/1
  def show
  end

  # GET /inventory_items/new
  def new
    @inventory_item = InventoryItem.new(warehouse_id: filter_params[:warehouse_id])
  end

  # GET /inventory_items/1/edit
  def edit
  end

  # POST /inventory_items
  def create
    @inventory_item = InventoryItem.new(inventory_item_params)

    respond_to do |format|
      if @inventory_item.save
        format.html { redirect_to inventory_item_url(@inventory_item), notice: I18n.t('inventory_items.successfully_created') }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inventory_items/1
  def update
    respond_to do |format|
      if @inventory_item.update(inventory_item_params)
        format.html { redirect_to inventory_item_url(@inventory_item), notice: I18n.t('inventory_items.successfully_updated') }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventory_items/1
  def destroy
    @inventory_item.destroy

    respond_to do |format|
      format.html { redirect_to inventory_items_url, notice: I18n.t('inventory_items.successfully_destroyed') }
    end
  end

  private

    def filter_params
      params.permit(:warehouse_id)
    end

    def set_inventory_item
      @inventory_item = InventoryItem.find(params[:id])
    end

    def inventory_item_params
      params.require(:inventory_item).permit(:warehouse_id, :status, :item_code, :price, :price_per_unit, :quantity, :weight)
    end
end
