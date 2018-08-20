class BuildingsController < ApplicationController
  def show
    @building = Building.find(params[:id])
    @total_rent = @building.companies.count * @building.rent_per_floor
  end

  def index
    @buildings = Building.all
  end

  def edit
    @building = Building.find(params[:id])
  end

  def update
    @building = Building.find(params[:id])
    @building.update(building_params)
    redirect_to building_path(@building)
  end

  private

  def building_params
    params.require(:building).permit(:name, :country, :address, :number_of_floors, :rent_per_floor)
  end
end
