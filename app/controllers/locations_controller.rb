class LocationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @locations = policy_scope(Location)
    if params[:query].present?
      sql_query = "name ILIKE :query OR address ILIKE :query OR location_type ILIKE :query"
      @locations = Location.where(sql_query, query: "%#{params[:query]}%")
    else
      @locations
    end
  end

  def show
    @location = Location.find(params[:id])
    @checkin = CheckIn.new
    @favorite = Favorite.new
    authorize @location
  end
end
