class OrdersController < ApplicationController
  def index
    @item_order = ItemOrder.new
    @item = Item.find(params[:item_id])
  end

  def create
    binding.pry
    @item = Item.find(params[:item_id])
    @item_order = ItemOrder.new(order_params)
    if @item_order.valid?
      @item_order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def order_params
    params.require(:item_order).permit(:postal_code, :prefecture, :city, :address, :building_name, :phone, :user_id, :item_id, :item_user_id)
  end

end