class StoriesController < ApplicationController
  def show
    @spot = Spot.find(params[:spot_id])
    @story = Story.find(params[:id])
  end

  def new
  end

  def create
  end
end
