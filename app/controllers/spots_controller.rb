class SpotsController < ApplicationController
  def index
    @spots = Spot.geocoded # returns spot with coordinates

    @markers = @spots.map do |spot|
      {
        lat: spot.latitude,
        lng: spot.longitude
      }
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
