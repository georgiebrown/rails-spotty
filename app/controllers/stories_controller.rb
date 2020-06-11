class StoriesController < ApplicationController
  def show
    @spot = Spot.find(params[:spot_id])
    @story = Story.find(params[:id])
  end

  def new
    @spot = Spot.find(params[:spot_id])
    @story = Story.new
    3.times do
      @photo = @story.photos.build
    end
  end

  def create
    @spot = Spot.find(params[:spot_id])
    @story = Story.new(story_params.except(:photo))
    @story.spot = @spot
    @story.user = current_user

    # if @photo.save
    #   @story.photos = @photo
    # else
    #   render 'new'
    # end

    if @story.save
      multiple_photos(story_params, @story)
      # @photo = Photo.new
      # @photo.file.attach(story_params[:photo][:file])
      # @photo.photoable = @story
      # @photo.save!
      redirect_to spot_story_path(@spot, @story)
    else
      render 'new'
    end
  end

  def multiple_photos(story_params, story)
    story_params[:photos_attributes].keys do |key|
      @photo = Photo.new
      @photo.file.attach(story_params[:photos_attributes][key][:file])
      @photo.photoable = story
      @photo.save!
    end
  end



  def story_params
    params.require(:story).permit(:content, photos_attributes:[:file])
  end
end
