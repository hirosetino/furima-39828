class ItemsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :edit]
    before_action :move_to_index, only: :edit

    def index
        @items = Item.all.order('created_at DESC')
    end

    def new
        @item = Item.new
    end

    def create
      @item = Item.new(item_params)
      if @item.save
          redirect_to root_path
      else
          render :new, status: :unprocessable_entity
      end
    end

    def show
        @item = Item.find(params[:id])
    end

    def edit
        @item = Item.find(params[:id])
    end

    def update
        @item = Item.find(params[:id])
        if @item.update(item_params)
            redirect_to item_path(@item.id)
        else
            render :edit, status: :unprocessable_entity
        end
    end

    private

    def item_params
        params.require(:item).permit(:name, :content, :category_id, :state_id, :shipping_cost_id, :prefecture_id, :days_to_ship_id,
                                  :price, :image).merge(user_id: current_user.id)
    end

    def move_to_index
        @item = Item.find(params[:id])
        unless @item.user.id == current_user.id
          redirect_to root_path
        end
    end
end
