class FavouritesController < ApplicationController
  def create
    @spot = Spot.find(params[:spot_id])
    @favourite = Favourite.new(:favourite_params)
  end

  def destroy
    @spot.destroy
  end

  private
  def favourite_params
    params.require(:spot).permit(:user_id, :spot_id)
  end
end
