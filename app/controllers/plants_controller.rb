class PlantsController < ApplicationController
  before_action :set_plant, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  def index
    @plants = Plant.all
  end

  def show
  end

  def new
    @plant = current_user.plants.build
  end

  def edit
  end

  def create
    @plant = current_user.plants.build(plant_params)
    if @plant.save
      redirect_to @plant, notice: 'Plant was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @plant.update(plant_params)
      redirect_to @plant, notice: 'Plant was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @plant.destroy
    redirect_to plants_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plant
      @plant = Plant.find(params[:id])
    end

    def correct_user
      @plant = currentuser.plants.find_by(id: params[:id])
      redirect_to pins_path, notice: "Not authorized to edit this plant" if @plant.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plant_params
      params.require(:plant).permit(:description, :image)
    end
end