class FollowsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    leader = User.find(params[:user_id])
    follow = Follow.new(leader: leader, follower: current_user)
    follow.save
    respond_to do |format|
      format.html
      format.json { render json: { follow: follow } }
    end
  end

  def destroy
    follow = Follow.find(params[:id])
    follow.destroy
    # redirect_back(fallback_location: spots_path)
  end
end
