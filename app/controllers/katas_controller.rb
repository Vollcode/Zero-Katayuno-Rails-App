class KatasController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  before_action :set_kata, only: [:show, :edit, :update, :destroy]
  
  def index
    @katas = Kata.all
  end

  def show
  end

  def create
    kata = Kata.new(kata_params)

    if kata.save
      redirect_to kata_path(kata.id)
    else
      render :new
    end
  end

  def new
    @kata = Kata.new
  end

  def edit
  end

  def update
    @kata.update(kata_params)

    redirect_to kata_path(@kata.id)
  end

  def destroy
    @kata.destroy

    redirect_to root_path
  end

  private

  def set_kata
    @kata = Kata.find(params[:id])
  end

  def kata_params
    params.require(:kata).permit(:title, :description)
  end
end
