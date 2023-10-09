class RecipesController < ApplicationController

    def new
        @recipe = Recipe.new(
          preparation_time: 0,
          cooking_time: 0,
          public: false
        )
    end

    def create
        @recipe = current_user.recipes.new(recipe_params)
      
        if @recipe.save
          redirect_to @recipe, notice: 'Recipe successfully created.'
        else
          render :new
        end
      end
    def index
      @recipes = current_user.recipes
    end
    
    def show
        @recipe = current_user.recipes.find(params[:id])

        if !@recipe.public?
            # Handle the case where the recipe is not public
            # For example, you can redirect to an error page or show a flash message
            redirect_to root_path, alert: 'Recipe not found.'
          end
    end

    private

    def recipe_params
      params.require(:recipe).permit(:name, :description, :preparation_time, :cooking_time, :public)
    end
  
  end