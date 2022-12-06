class VideosController < ApplicationController
  skip_after_action :verify_policy_scoped, only: :index
  def index
    @location = Location.find(params[:id])
  end
end
