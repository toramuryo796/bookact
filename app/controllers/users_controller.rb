class UsersController < ApplicationController
  def show
    @user = current_user
    @introduces = user.introduces
    @categories = Category.all
    @acts = user.acts
  end
end
