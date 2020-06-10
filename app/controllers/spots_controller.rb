class SpotsController < ApplicationController
  def index

    if params[:query].present?
      @spots = Spot.geocoded
      @spots = Spot.global_search(params[:query_attributes]).select { |spot| spot.geocoded? }

    else
      @spots = Spot.geocoded
    end


    @spots = @spots.near(params[:query_location], 5) if params[:query_location].present? && !@spots.empty?
    # spots.near(location search)
    @markers = @spots.map do |spot| {

      lat: spot.latitude,
      lng: spot.longitude,
      # infoWindow: render_to_string(partial: "info_window", locals: { spot: spot }),
      # image_url: helpers.asset_url('icon.png')
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
