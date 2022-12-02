class FeedbacksController < ApplicationController
  def new
  end

  def create
    @feedback = Feedback.new(ath_feedback)
    @feedback.user_id = current_user.id
    @feedback.location_id = Location.find(params[:location_id]).id
    @feedback.save
    authorize @feedback
  end

  def destroy
  end

  private

  def ath_feedback
    params.require(:feedback).permit(:comment, :rating, photos: [], videos: [])
  end
end
