class FollowingsController < ApplicationController
  def create
    following = current_user.followings.build(followed_id: params[:followed_id])
    if following.save
      redirect_to root_path, notice: "You are now following #{User.find(params[:followed_id]).fullname}"
    else
      redirect_to root_path, alert: 'Process of following a user failed!'
    end
  end

  def destroy
    @user = User.find(params[:followed_id])
    following = current_user.followings.find_by(followed_id: params[:followed_id])
    if following.destroy
      redirect_to user_path(@user), notice: "You no longer follow #{User.find(params[:followed_id]).fullname}"
    else
      redirect_to user_path(@user), alert: 'Unfollowing process failed!'
    end
  end
end
