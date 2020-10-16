class UsersController < ApplicationController
  before_action :find_books_category
  
  def show
    @introduces = @user.introduces
    @acts = @user.acts
    @num = 0 #紹介のある本の数
    @actNum = 0 #紹介文の数
  end
  
  def book
  end
  
  private
  def find_books_category
    @categories = Category.all
    @books = Book.all
  end
end
