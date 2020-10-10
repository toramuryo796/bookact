class BooksController < ApplicationController
  before_action :find_book, except: [:index, :create, :book_params]
  before_action :move_to_devise, except: [:index, :show]
  require 'date'

  def index
    @books = Book.all.includes(:user)
  end

  def new
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
    if book.save
      redirect_to new_book_introduce_path(book)
    else
      render :new
    end
  end

  def show
    @introduces = @book.introduces
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def book_params
    params.permit(:title, :writer, :company, :content, :publish).merge(user_id: current_user.id)
  end

  def move_to_devise
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def find_book
    @book = Book.find_by(id: params[:id])
  end
end
