class ImagesController < ApplicationController
  skip_after_action :verify_policy_scoped, only: :index
  def index
    @location = Location.find(params[:location_id])
    @feedbacks = Feedback.where(location_id: params[:location_id])
  end
end
