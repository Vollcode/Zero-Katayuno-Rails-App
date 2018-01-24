class KatasController < ApplicationController

  def index
    @katas = Kata.all
  end

  def show
    @kata = Kata.find(params[:id])
  end

  def create
    kata = Kata.new(
      title: params[:title],
      description: params[:description]
      )
    if kata.save
      redirect_to kata_path(kata.id)
    else
      render :new
    end
  end

  def new
  end

  def edit
    @kata = Kata.find(params[:id])
    render :edit
  end

  def update
    kata = Kata.find(params[:id])
    kata.title = params[:kata][:title]
    kata.description = params[:kata][:description]
    kata.save

    redirect_to kata_path(kata.id)
  end

  def delete
    kata = Kata.find(params[:id])
    kata.delete

    redirect_to root_path
  end
end
