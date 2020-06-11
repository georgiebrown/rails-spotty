class SpotsController < ApplicationController
  def index
    if params[:query].present?
      @spots = Spot.geocoded
      @spots = Spot.search_by_name_location_and_category(params[:query])
    else
      @spots = Spot.geocoded
    end

    @spots = @spots.near(params[:query_location], 5) if (params[:query_location].present? && !@spots.empty?)
    # spots.near(location search)
    @markers = @spots.map do |spot| {
      icon: spot.category.icon,
      lat: spot.latitude,
      lng: spot.longitude,
      infoWindow: { content: render_to_string(partial: "info_window", locals: { spot: spot }) }
      # image_url: helpers.asset_url('icon.png')
    }
  end
end

def show
  @spot = Spot.find(params[:id])
  @stories = @spot.stories
end
end
