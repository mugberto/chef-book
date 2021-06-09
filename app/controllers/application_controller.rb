class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def user_authenticated?
    true if current_user
  end

  private

  def require_login
    return if user_authenticated?

    flash[:alert] = 'You must be logged in to access this section'
    redirect_to new_session_path
  end
end
