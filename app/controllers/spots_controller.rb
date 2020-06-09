class SpotsController < ApplicationController
  def index
    @spots = Spot.all
  end

  def show
    @story = Story.new
    @spot = Spot.find(params[:id])

      #   @markers =
      # [{
      #   lat: @spot.latitude,
      #   lng: @spot.longitude,
      #   infoWindow: render_to_string(partial: "info_window", locals: { spot: @spot }),
      #   image_url: helpers.asset_url('map_icon.png')
      # }]
  end


end
