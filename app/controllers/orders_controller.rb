class OrderController < ApplicationController
  def index
    @item_order = ItemOrder.new
  end
end
