class OrdersController < ApplicationController
  def index
    @item_order = ItemOrder.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item_order = ItemOrder.new(item_order_params)
    @item = Item.find(params[:item_id])
    if @item_order.valid?
      @item_order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def item_order_params
    params.require(:item_order).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end