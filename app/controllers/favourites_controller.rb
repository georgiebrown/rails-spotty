class FavouritesController < ApplicationController
  def create
    @spot = Spot.find(params[:spot_id])
    @favourite = Favourite.new(:favourite_params)
    @favourite.user = current_user
  end

  def destroy
    @spot.destroy
  end

  private
  def favourite_params
    params.require(:favourite).permit(:user_id, :spot_id)
  end
end
