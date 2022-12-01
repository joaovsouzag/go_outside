class FavoritesController < ApplicationController
  before_action :find_location, only: %i[create destroy]

  def index
  end

  def create
    @favorite = Favorite.new
    @favorite.user = current_user
    @favorite.location_id = @location.id
    @favorite.save
    authorize @favorite
    redirect_to location_path(@location)
  end

  def destroy
    @favorite = Favorite.where(location_id: @location.id, user_id: current_user.id).first
    @favorite.destroy
    authorize @favorite
    redirect_to location_path
  end

  private

  def find_location
    @location = Location.find(params[:location_id])
  end
end
