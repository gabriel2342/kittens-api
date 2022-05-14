class KittensController < ApplicationController
  before_action :set_Kitten, only: [:show, :edit, :update, :destroy]

  def index
    @Kittens = Kitten.all
  end

  def show
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)

    if @kitten.save
      redirect_to kittens_path, notice: "Kitten was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @kitten.update(kitten_params)
      redirect_to kittens_path, notice: "Kitten was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @kitten.destroy
    redirect_to kittens_path, notice: "Kitten was successfully destroyed."
  end

  private

  def set_Kitten
    @kitten = Kitten.find(params[:id])
  end

  def kitten_params
    params.require(:kitten).permit(:name)
  end
end

