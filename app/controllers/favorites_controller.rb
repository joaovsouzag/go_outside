class FavoritesController < ApplicationController
  def index
  end

  def create
    @location = Location.find(params[:location_id])
    @favorite = Favorite.new
    @favorite.user = current_user
    @favorite.location_id = @location.id
    @favorite.save
    authorize @favorite
    redirect_to location_path(@location)
  end

  def destroy
    @favorite = Favorite.find(current_user.favorites.ids.first)
    @favorite.destroy
    authorize @favorite
    redirect_to location_path
  end
end
