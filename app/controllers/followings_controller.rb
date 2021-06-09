class FollowingsController < ApplicationController
  def create
    following = current_user.followings.build(followed_id: params[:followed_id])
    if following.save
      redirect_to root_path, notice: "You are now following #{User.find(params[:followed_id]).fullname}"
    else
      flash.now[:alert] = 'Error!'
    end
  end
end
