class ShoppingListController < ApplicationController
  def index
    user = current_user
    @shopping_list = user.generate_shopping_list
    @missing_food_list = @shopping_list[:missing_food_list]
    @total_food_items = @shopping_list[:total_food_items]
    @total_price = @shopping_list[:total_price]
  end
end