class LocationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @locations = policy_scope(Location)
    # if params[:query].present? && params[:location_type] == ""
    #   sql_query = "name ILIKE :query OR address ILIKE :query OR location_type ILIKE :query"
    #   @locations = policy_scope(Location).search_by_name_and_address(params[:query])
    # elsif params[:query].present? && params[:location_type] == "1"
    #   @first_locations = policy_scope(Location).search_by_location_type("Bar")
    #   @locations = @first_locations.search_by_name_and_address(params[:query])
    # elsif params[:query].present? && params[:location_type] == "2"
    #   @first_locations = policy_scope(Location).search_by_location_type("Night Club")
    #   @locations = @first_locations.search_by_name_and_address(params[:query])
    # end

    @locations = @locations.search_by_name_and_address(params[:query]) if params[:query].present?
    @locations = @locations.search_by_name_and_address(params[:address]) if params[:address].present? && params[:address] != "Address"
    @locations = @locations.search_by_location_type(params[:location_type]) if params[:location_type].present? && params[:location_type] != "Location Type"


  end
  def show
    @location = Location.find(params[:id])
    @checkin = CheckIn.new
    @favorite = Favorite.new
    @feedback = Feedback.new
    authorize @location
    @chatroom = @location.chatroom
    # @chatroom = Chatroom.find(params[:id])
    @message = Message.new

    @check_favorite = current_user.favorites.all? { |favorite| favorite.location_id != @location.id }
  end


  def myfavorites
    @favorites = Favorite.where(user_id: current_user.id)
    @locations = @favorites.map { |fv| fv.location}
    authorize @favorites
  end

end
