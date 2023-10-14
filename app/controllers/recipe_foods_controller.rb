class RecipeFoodsController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.new
    @foods = Food.all
  end

  def create
    @recipe_food = RecipeFood.new(recipe_food_params)
    if @recipe_food.save
      redirect_to @recipe_food.recipe, notice: 'Ingredient added successfully.'
    else
      @foods = Food.all
      redirect_to @recipe_food.recipe, notice: 'Ingredient already added.'
    end
  end

  def edit_quantity
    @recipe_food = RecipeFood.find(params[:id])
  end

  def update_quantity
    @recipe_food = RecipeFood.find(params[:id])
    Rails.logger.info "Params: #{params.inspect}"
    if @recipe_food.update(quantity: params[:recipe_food][:quantity])
      redirect_to @recipe_food.recipe, notice: 'Ingredient quantity successfully updated.'
    else
      flash[:error] = 'Failed to update ingredient quantity.'
      redirect_to @recipe_food.recipe
    end
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy
    redirect_to @recipe_food.recipe
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :recipe_id, :food_id)
  end
end
