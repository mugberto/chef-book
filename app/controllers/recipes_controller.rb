class RecipesController < ApplicationController
  before_action :require_login

  def index
    @recipe = Recipe.new
    @recipes = current_user.recipes_of_people_he_follows_and_his.includes(:user)
    @people_to_follow = User.all.reject { |user| current_user.followed_user?(user) or user == current_user }
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      redirect_to root_path, notice: 'A new recipe added!'
    else
      redirect_to root_path, alert: 'Error: no recipe added!'
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:description)
  end
end
