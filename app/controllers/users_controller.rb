class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  def index
    if params[:query].present?
      @users = User.user_search(params[:query])
    else
      @users = User.all
    end
  end

  def show
  end

  def edit
  end

  def update
    @user.update(user_params)
    avatar = @user.photo
    avatar.file.detach
    avatar.file.attach(params[:no_model_fields][:photo_file])
    @user.photo = [avatar]
    @user.save
  end

  def followers
    @users = current_user.followers
  end

  def follows
    @users = current_user.leaders
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :bio)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
