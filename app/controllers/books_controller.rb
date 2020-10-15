class BooksController < ApplicationController
  before_action :find_book,         except: [:index, :create, :book_params, :rate]
  before_action :move_to_devise,    except: [:index, :show]
  before_action :categories,        only: [:index, :new, :edit, :show, :create, :category, :search]
  before_action :confirm_introduce, only: [:edit, :show]
  before_action :rate,              only: [:show, :edit]
  require 'date'

  def index
    @books = Book.all.includes(:user)
    @categories = Category.all
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
    if @book.update(book_params)
      redirect_to book_path(@book)
    else
      render :edit
    end
  end
  
  def destroy
  end
  
  def category
    @data = params[:category_id]
    @category = Category.find_by(id: @data)
    @books = Book.where(category_id: @data)
  end
  
  def search
    @books = SearchBooks.search(params[:keyword])
  end
  private
  def book_params
    params.permit(:title, :writer, :company, :content, :publish, :category_id, :image).merge(user_id: current_user.id)
  end
  
  def move_to_devise
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
  
  def find_book
    @book = Book.find_by(id: params[:id])
  end
  
  def categories
    @categories = Category.all
  end
  
  # すでに紹介文があるか確認
  def confirm_introduce
    @exist = IntroduceConfirm.introduce(@book, current_user)
  end

  # 評価
  def rate
    @rate = StarRate.rate(@book)
  end
end
