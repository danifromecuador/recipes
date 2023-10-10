class ShoppingListController < ApplicationController
  def index
    @user = current_user
    @shopping_list = @user.generate_shopping_list
  end
end