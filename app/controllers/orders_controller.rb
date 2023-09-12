class OrdersController < ApplicationController
    before_action :set_item, only: [:index, :create]
    before_action :authenticate_user!, only: [:index, :create]
    before_action :move_to_index, only: [:index, :create]
    def index
        @history_order = HistoryOrder.new
    end

    def create
        @history_order = HistoryOrder.new(order_params)

        if @history_order.valid?
            @history_order.save
            redirect_to root_path
        else
            render :index, status: :unprocessable_entity
        end
    end

    private

    def set_item
        item_id = params[:item_id]
        @item = Item.find(item_id)
    end

    def order_params
        params.require(:history_order).permit(:post_code, :prefecture_id, :municipalities, :street_address, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: @item.id)
    end

    def move_to_index
        if @item.user_id == current_user.id || @item.history.present?
            redirect_to root_path
        end
    end

end
