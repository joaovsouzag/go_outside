class CheckInsController < ApplicationController
  def index
    @checkin = CheckIn.all
  end

  def create
    @location = Location.find(params[:location_id])
    @checkin = CheckIn.new
    @checkin.user = current_user
    @checkin.location_id = @location.id
    @checkin.save
    authorize @checkin
    redirect_to location_path(@location)
  end

  def destroy
    @checkin = CheckIn.find(current_user.check_in.id)
    @checkin.destroy
    authorize @checkin
    redirect_to location_path
  end
end
