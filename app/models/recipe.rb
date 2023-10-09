class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, foreign_key: 'recipe_id'
  has_many :foods, through: :recipe_foods

  def total_price
    #   # Calculate the total price for the recipe
    #   recipe_foods.sum { |rf| rf.quantity * rf.food.price }
  end
end
