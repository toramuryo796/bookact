class UsersController < ApplicationController
  def show
    @introduces = @user.introduces
    @categories = Category.all
    @books = Book.all
    @acts = @user.acts
    @num = 0 #紹介のある本の数
    @actNum = 0 #紹介文の数
  end
end
