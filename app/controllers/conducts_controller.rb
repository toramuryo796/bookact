class ConductsController < ApplicationController
  def index
    @acts = Act.where(user_id: current_user.id)
    @books = Book.all.includes(:user)
    @categories = Category.all
    @user = current_user
  end
end
