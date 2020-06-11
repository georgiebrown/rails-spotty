class FollowsController < ApplicationController
  def create
    leader = User.find(params[:user_id])
    follow = Follow.new(leader: leader, follower: current_user)
    follow.save
    redirect_back(fallback_location: spots_path)
  end

  def destroy
    follow = Follow.find(params[:id])
    follow.destroy
    redirect_back(fallback_location: spots_path)
  end
end
