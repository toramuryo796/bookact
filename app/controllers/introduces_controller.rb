class IntroducesController < ApplicationController
  before_action :move_to_log_in
  before_action :find_book,         except: :move_to_log_in
  before_action :find_introduce,    only: [:edit, :update, :destroy]
  before_action :categories,        only: [:new, :edit]
  before_action :confirm_introduce, only: [:new, :edit]
  before_action :rate,              only: [:new, :show, :edit]

  def new
    @introduce = Introduce.new()
  end

  def create
    introduce = Introduce.new(introduce_params)
    if introduce.save
      redirect_to book_path(introduce.book_id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @introduce.update(introduce_params)
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def destroy
    @introduce.destroy
    redirect_to book_path(@book)
  end

  private
  def introduce_params
    params.require(:introduce).permit(:title, :content, :star_id).merge(user_id: current_user.id, book_id: params[:book_id])
  end

  def find_book
    @book = Book.find(params[:book_id])
  end

  def find_introduce
    @introduce = Introduce.find(params[:id])
  end

  def categories
    @categories = Category.all
  end

  # すでに紹介文があるか確認
  def confirm_introduce
    @exist = IntroduceConfirm.introduce(@book, current_user)
  end

  def move_to_log_in
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  # 評価
  def rate
    @rate = StarRate.rate(@book)
  end
end
