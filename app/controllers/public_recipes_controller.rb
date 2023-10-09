class PublicRecipesController < ApplicationController
    def index
      @recipes = Recipe.where(public: true).order(created_at: :desc)
    end
  
    def show
      @recipe = Recipe.find(params[:id])
  
      if !@recipe.public?
        redirect_to public_recipes_path, alert: 'Recipe not found.'
      end
    end
end

