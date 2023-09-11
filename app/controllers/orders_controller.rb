class OrdersController < ApplicationController
    def index
        item_id = params[:item_id]
        @item = Item.find(item_id)
        @order_history = OrderHistory.new
    end

    def create
        @order_history = OrderHistory.new(order_params)
        if @order_history.valid?
        @order_history.save
        redirect_to root_path
        else
        render :index, status: :unprocessable_entity
        end
    end

    private
    def order_params
        params.require(:order_history).permit(:post_code, :prefecture_id, :municipalities, :street_address, :building_name, :telephone_number, :history_id, :item_id).merge(user: current_user.id)
    end
end
