class SpotsController < ApplicationController
  def index
     if params[:query].present?
      @spots = Spot.search(params[:search])
    else
      @spots = Spot.all
    end
  end

  def show
    @story = Story.new
    @spot = Spot.find(params[:id])
    user = current_user
    if user
      @stories = @spot.stories.where("user_id = ")
    end
      #   @markers =
      # [{
      #   lat: @spot.latitude,
      #   lng: @spot.longitude,
      #   infoWindow: render_to_string(partial: "info_window", locals: { spot: @spot }),
      #   image_url: helpers.asset_url('map_icon.png')
      # }]
  end

end
