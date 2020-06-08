class StoriesController < ApplicationController
  def show
    @spot = Spot.find(params[:spot_id])
    @story = Story.find(params[:id])
  end

  def new
    @spot = Spot.find(params[:spot_id])
    @story = Story.new
    @story.spot = @spot
    if @story.save
      redirect_to spot_story
    else
      render 'new'
    end
  end

  def create
    @spot = Spot.find(params[:spot_id])
    @story = Story.new(story_params)
    @story.user = current_user
    if story.save
      redirect_to spot_story_path(@spot)
  end


  def story_params
    params.require(:story).permit(:content, :title)
  end
end
