class OrdersController < ApplicationController
    def index
        @order_history = OrderHistory.new
    end

    def create
        @order_history = order_history.new(order_params)
        if @order_history.valid?
        @order_history.save
        redirect_to root_path
        else
        render :index, status: :unprocessable_entity
        end
    end

    private
    def order_params
        params.require(:order_history).permit(:post_code, :prefecture_id, :municipalities, :street_address, :building_name, :telephone_number, :history.id).merge(user: current_user.id, item: item.id)
    end
end
