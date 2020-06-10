class FollowsController < ApplicationController
  def create
    follow = Follow.new(leader: params[:user_id], follower: current_user)
    follow.save
    redirect_to spots_path
  end

  def destroy
    leader_id = User.find(params[:user_id]).id
    follow = Follow.where("leader_id = #{leader_id} and follower_id = #{current_user.id}")
    follow.destroy
    redirect_to spots_path
  end
end
