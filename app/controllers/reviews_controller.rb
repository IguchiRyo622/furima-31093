class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to item_path(@review.item)
    else
      @item = @review.item
      @reviews = @item.reviews
      render "items/show"
    end
  end

  private
  def review_params
    params.require(:review).permit(:review).merge(user_id: current_user.id, item_id: params[:item_id], item_user_id:params[:item_user_id])
  end
end
