class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_user_path, notice: 'Signed up successfully'
    else
      flash.now[:alert] = 'Sign up not successful'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :fullname, :photo, :coverimage)
  end
end
