class IntroducesController < ApplicationController
  before_action :find_book
  before_action :find_introduce,  only: [:edit, :update, :destroy]
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
    params.require(:introduce).permit(:title, :content).merge(user_id: current_user.id, book_id: params[:book_id])
  end

  def find_book
    @book = Book.find(params[:book_id])
  end

  def find_introduce
    @introduce = Introduce.find(params[:id])
  end
end
