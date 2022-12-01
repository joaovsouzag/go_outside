class LocationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @locations = policy_scope(Location)
    if params[:query].present?
      sql_query = "name ILIKE :query OR address ILIKE :query OR location_type ILIKE :query"
      @locations = Location.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @locations
    end
  end

  def show
    @location = Location.find(params[:id])
    @checkin = CheckIn.new
    @favorite = Favorite.new
    @feedback = Feedback.new
    authorize @location
    @check_favorite = current_user.favorites.all? { |favorite| favorite.location_id != @location.id }
  end
end
