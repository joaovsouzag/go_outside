class FeedbacksController < ApplicationController
  def new
  end

  def create
    @location = Location.find(params[:location_id])
    @feedback = Feedback.new(ath_feedback)
    @feedback.user_id = current_user.id
    @feedback.location_id = Location.find(params[:location_id]).id
    @feedback.save
    authorize @feedback
    redirect_to location_path(@location)
  end

  def destroy
  end

  private

  def ath_feedback
    params.require(:feedback).permit(:comment, :rating, photos: [], videos: [])
  end
end
