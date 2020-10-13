class ActsController < ApplicationController
  before_action :categories
  before_action :find_acts, only: [:show, :edit, :update, :destroy]
  before_action :find_act, only: [:show, :edit, :update, :destroy]
  def new
    @act = Act.new()
    @book = Book.find(params[:book_id])
  end
  
  def create 
    @book = Book.find(params[:book_id])
    @act = Act.new(act_params)
    if @act.save
      redirect_to acts_path
    else
      render :new
    end
  end

  def index
    @acts = Act.where(user_id: current_user.id)
    @books = Book.all.includes(:user)
  end

  def show
  end

  def edit
  end

  def update
    if @act.update(act_params)
      redirect_to acts_path(book_id: @act.book)
    else
      render :edit
    end
  end

  def destroy
    @act.destroy
    redirect_to acts_path(book_id: @act.book)
  end
  
  private
  def act_params
    params.require(:act).permit(:page, :content, :point, :act).merge(book_id: params[:book_id], user_id: current_user.id)
  end
  
  def categories
    @categories = Category.all
  end
  
  def find_acts
    @book = Book.find_by(id: params[:book_id])
    @acts = Act.where(book_id: @book.id, user_id: current_user.id)
  end

  def find_act
    @act = Act.find(params[:id])
  end
end
