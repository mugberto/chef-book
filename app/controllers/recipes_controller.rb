class RecipesController < ApplicationController
  before_action :require_login
  
  def index
    @recipes = current_user.recipes_of_people_he_follows_and_his
  end
end
