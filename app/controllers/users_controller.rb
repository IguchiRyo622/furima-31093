class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @items = current_user.items
  end
end
