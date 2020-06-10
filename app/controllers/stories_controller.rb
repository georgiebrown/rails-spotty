class StoriesController < ApplicationController
  def show
    @spot = Spot.find(params[:spot_id])
    @story = Story.find(params[:id])
  end

  def new
    @spot = Spot.find(params[:spot_id])
    @story = Story.new
  end

  def create
    @spot = Spot.find(params[:spot_id])
    @story = Story.new(story_params)
    @story.spot = @spot
    @story.user = current_user

    # if @photo.save
    #   @story.photos = @photo
    # else
    #   render 'new'
    # end

    if @story.save
      @photo = Photo.new
      @photo.file.attach(params[:story][:file])
      @photo.photoable = @story
      @photo.save!
      redirect_to spot_story_path(@spot, @story)
    else
      render 'new'
    end
  end


  def story_params
    params.require(:story).permit(:content, photos_attributes:[:file])
  end
end
