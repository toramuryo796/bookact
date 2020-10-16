class ActsController < ApplicationController
  before_action :move_to_log_in
  before_action :categories
  before_action :find_acts_book, only: [:show, :new, :edit, :update, :destroy, :rate, :acts]
  before_action :find_act, only: [:show, :edit, :update, :destroy, :acts]
  before_action :confirm_introduce, only: [:show, :edit, :new, :acts]
  before_action :rate, only: [:new, :edit, :show, :acts]
  before_action :confirm_act, only: [:new, :show, :ceate, :edit, :update, :show, :acts]

  def new
    @act = Act.new()
  end

  def create
    @book = Book.find_by(id: params[:book_id])
    @act = Act.new(act_params)
    if @act.save
      redirect_to book_act_path(@book, @act)
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
    @book = Book.find_by(id: params[:book_id])
    if @act.update(act_params)
      redirect_to book_act_path(@book, @act)
    else
      render :edit
    end
  end

  def destroy
    @act.destroy
    redirect_to book_act_path(@book, @act)
  end

  def acts
  end

  private

  def act_params
    params.require(:act).permit(:page, :content, :point, :act).merge(user_id: current_user.id, book_id: params[:book_id])
  end

  def categories
    @categories = Category.all
  end

  def find_acts_book
    @book = Book.find_by(id: params[:book_id])
    @acts = Act.where(book_id: @book.id, user_id: current_user.id)
  end

  def find_act
    @act = Act.find(params[:id])
  end

  def move_to_log_in
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  # すでに紹介文があるか確認
  def confirm_introduce
    @book = Book.find_by(id: params[:book_id])
    @exist = IntroduceConfirm.introduce(@book, current_user)
  end

  # 評価
  def rate
    @rate = StarRate.rate(@book)
  end

  def confirm_act
    @book = Book.find_by(id: params[:book_id])
    unless @acts.present?
      @existAct = true
    end
  end
end
