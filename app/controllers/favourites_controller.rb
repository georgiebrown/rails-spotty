class FavouritesController < ApplicationController

  def show
    @spot = Spot.find(params[:spot_id])
    @favourite = Favourite.new
  end

  def new
    @spot = Spot.find(params[:spot_id])
    @spot = Spot.new
  end

  def create
    @spot = Spot.find(params[:spot_id])
    @favourite = Favourite.new(:favourite_params)
    @favourite.user = current_user
    if @favourite.save
      redirect_to favourite_path(@favourite)
    else
      render 'new'
    end
  end

  def destroy
    @spot.destroy
  end

  private
  def favourite_params
    params.require(:favourite).permit(:user_id, :spot_id)
  end
end
