class FavouritesController < ApplicationController
  def index
    @favourites = Favourite.where(user: current_user)
  end

  # def show
  #   @favourite = Favourite.find(params[:id])
  # end

  # def new
  #   @spot = Spot.find(params[:spot_id])
  #   @favourite = Favourite.new
  # end

  def create
    spot = Spot.find(params[:spot_id])
    favourite = Favourite.new(user: current_user, spot: spot)
    favourite.save
    respond_to do |format|
      format.html
      format.json { render json: { favourite: favourite } }
    end
  end

  def destroy
    @favourite = Favourite.find(params[:id])
    @favourite.destroy
  end

  # private

  # def favourite_params
  #   params.require(:favourite).permit(:user_id, :spot_id)
  # end
end
