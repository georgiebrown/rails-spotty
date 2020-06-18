class StoriesController < ApplicationController
  def show
    @spot = Spot.find(params[:spot_id])
    @story = Story.find(params[:id])
  end

  def new
    @spot = Spot.find(params[:spot_id])
    @story = Story.new
    # 3.times do
    @photo = @story.photos.build
    # end
  end

  def create
    @spot = Spot.find(params[:spot_id])
    @story = Story.new(story_params.except(:photos_attributes, :question))
    @story.spot = @spot
    @story.user = current_user
    @story.question = Question.find(story_params[:question])
    if  @story.save
      multiple_photos(params[:story][:photos], @story)
      # @photo = Photo.new
      # @photo.file.attach(story_params[:photo][:file])
      # @photo.photoable = @story
      # @photo.save!
      redirect_to spots_path
    else
      render 'new'
    end
  end
  # params[:story][:photos_attributes]["0"][:file]
  def multiple_photos(story_params, story)
    story_params[:file].each do |image|
      @photo = Photo.new
      @photo.file.attach(image)
      @photo.photoable = story
      @photo.save!
    end
  end

  def story_params
    params.require(:story).permit(:content, :question, photos_attributes: [:file])
  end
end
