class UsersController < ApplicationController
  def new
    @user = User.new
    render 'new', layout: 'auth_layout'
  end

  def show
    @user = User.find(params[:id])
    @recipes = @user.recipes
  end

  def index
    @users = User.all
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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to edit_user_path(@user), notice: 'User profile modified'
    else
      flash.now[:alert] = 'User profile not modified'
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to new_user_path, notice: 'User removed'
  end

  private

  def user_params
    params.require(:user).permit(:username, :fullname, :photo, :coverimage)
  end
end
