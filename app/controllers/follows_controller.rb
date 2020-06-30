class FollowsController < ApplicationController

  def create
    leader = User.find(params[:id])
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
  end
end
