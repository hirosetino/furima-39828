class ItemsController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  private

  def item_params
    params.require(:item).permit(:name, :content, :category_id, :state_id, :shipping_cost_id, :prefecture_id, :days_to_ship_id, :price, :image)
  end
end
