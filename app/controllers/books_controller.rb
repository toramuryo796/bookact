class BooksController < ApplicationController
  def index
    @books = Book.all.includes(:user)
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def book_params
    params.require(:book).permit(:title, :writer, :publish, :company).merge(user_id: current_user.id)
  end
end
