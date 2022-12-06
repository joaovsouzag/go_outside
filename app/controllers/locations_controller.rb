class LocationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

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
    @feedback = Feedback.new
    authorize @location
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    @check_favorite = current_user.favorites.all? { |favorite| favorite.location_id != @location.id }
  end
end
