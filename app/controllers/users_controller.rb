class UsersController < ApplicationController
  before_action :find_books_category
  
  def show
    @introduces = @user.introduces
    @acts = @user.acts
    @num = 0 #viewで3つ目を数えるためのもの(book)
    @actNum = 0 #同上(act)
    @booksData = 0
    @actsData = 0

    @introduces.each do |introduce|
      @booksData += 1
    end

    @acts.each do |act|
      @actsData+= 1
    end
  end
  
  def book
  end
  
  private
  def find_books_category
    @categories = Category.all
    @books = Book.all
  end
end
