class FollowsController < ApplicationController
  def create
    leader = User.find(params[:user_id])
    follow = Follow.new(leader: leader, follower: current_user)
    follow.save
    redirect_to spots_path
  end

  def destroy
    follow = Follow.find(params[:id])
    follow.destroy
    redirect_to spots_path
  end
end
