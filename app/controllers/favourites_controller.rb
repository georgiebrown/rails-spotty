class FavouritesController < ApplicationController
  def index
    @favourites = Favourite.where(user:current_user)
  end

  def show
    @favourite = Favourite.find(params[:id].to_i)

  end

  def new
    @spot = Spot.find(params[:spot_id])
    @favourite = Favourite.new
  end

  def create
    @spot = Spot.find(params[:spot_id])
    @favourite = Favourite.new
    @favourite.user = current_user
    @favourite.spot = @spot
    if @favourite.save
      redirect_to favourites_path
    else
      render 'new'
    end
  end

  def destroy
    @favourite.destroy
    redirect_to favourites_path
  end

  private
  def favourite_params
    params.require(:favourite).permit(:user_id, :spot_id)
  end
end
