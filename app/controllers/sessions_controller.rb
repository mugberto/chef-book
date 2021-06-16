class SessionsController < ApplicationController
  def new
    render 'new', layout: 'auth_layout'
  end

  def create
    if User.authenticated user_params
      @user = User.find_by(username: user_params[:username])
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Logged in successfully'
    else
      flash.now[:alert] = 'Sign in failed!'
      render 'new', layout: 'auth_layout'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path, notice: 'Logged out successfully'
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
