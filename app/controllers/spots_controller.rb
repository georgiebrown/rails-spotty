class SpotsController < ApplicationController
  require "open-uri"

  def index
    @spots = following_only
    @spots = @spots.geocoded
    if params[:query].present?
      @spots = @spots.search_by_name_location_and_category(params[:query])
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

  def new
    @spot = Spot.new
  end

  def create
    @spot = Spot.new(spot_params)
    @user = current_user
      if @spot.save
        redirect_to spot_path(@spot)
      else
        render 'new'
      end
  end
    # @spot = Spot.new(spot_params)
    # @user = current_user
    # file = URI.open(spot_params[:photos])
    # @spot.photo.attach(io: file, filename: "#{spot.name}", content_type: 'image/png')
    #   if @spot.save
    #     redirect_to spot_path(@spot)
    #   else
    #     render 'new'
    #   end

  def destroy
    @spot.destroy
    redirect_to spots_path
  end

  private

  def spot_params
    params.require(:spot).permit(:location, :name, :category_id, :photos)
  end

  # returns spots with associated stories created by users the current user is following
  def following_only
    Spot.includes(:stories).where(stories: { user_id: current_user.leaders_ids + [current_user.id] })
  end
end
