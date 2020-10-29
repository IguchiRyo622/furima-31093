class ItemsController < ApplicationController
  def index
  end

  private
  def item_params
    params.require(:item).permit(:name, :info, :price, :category_id, :condition_id, :fee_id, :prefecture_id, :scheduled_id, :image).merge(user_id: current_user.id)
end
