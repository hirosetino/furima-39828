class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]
  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @history_order = HistoryOrder.new
  end

  def create
    @history_order = HistoryOrder.new(order_params)

    if @history_order.valid?
      pay_item
      @history_order.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    item_id = params[:item_id]
    @item = Item.find(item_id)
  end

  def order_params
    params.require(:history_order).permit(:post_code, :prefecture_id, :municipalities, :street_address, :building_name, :telephone_number).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
  end

  def move_to_index
    return unless @item.user_id == current_user.id || @item.history.present?

    redirect_to root_path
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
