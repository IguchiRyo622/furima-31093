class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_item, only: [:show, :edit, :update]
  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    if current_user == @item.user
      render :edit
    elsif current_user
      redirect_to root_path
    else
      redirect_to new_user_session_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :info, :price, :category_id, :condition_id, :fee_id, :prefecture_id, :scheduled_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
end
