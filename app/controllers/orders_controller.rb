class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_item, only: [:index, :create]
  before_action :validate, only: :index

  def index
    @item_order = ItemOrder.new
  end

  def create
    @item_order = ItemOrder.new(item_order_params)
    if @item_order.valid?
      pay_item
      @item_order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def item_order_params
    params.require(:item_order).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: item_order_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def validate
    @item = Item.find(params[:item_id])
    redirect_to root_path if (user_signed_in? && current_user.id == @item.user_id) || @item.item_user.present?
  end
end
