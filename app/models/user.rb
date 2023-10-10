class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :recipes, foreign_key: 'user_id'
  has_many :foods, foreign_key: 'user_id'

  validates :name, presence: true

  def generate_shopping_list
    recipes = self.recipes
    user_food_list = Food.where(user_id: self.id)
    missing_food_list = []
    total_food_items = 0
    total_price = 0
    recipes.each do |recipe|
      recipe.foods.each do |food|
        if user_food_list.where(id: food.id).empty? || user_food_list.find(food.id).quantity < food.recipe_foods.find_by(recipe_id: recipe.id).quantity
          missing_food_list << food
          total_food_items += 1
          total_price += food.price * (food.recipe_foods.find_by(recipe_id: recipe.id).quantity - user_food_list.find(food.id).quantity)
        end
      end
    end
    shopping_list = []
    missing_food_list.each do |food|
      recipe_food = food.recipe_foods.find_by(recipe_id: recipes.pluck(:id))
      if recipe_food
        quantity_to_buy = recipe_food.quantity - user_food_list.find(food.id).quantity
        price = quantity_to_buy * food.price
        shopping_list << { food: food, quantity: quantity_to_buy, price: price }
      end
    end
    {
      shopping_list: shopping_list,
      total_food_items: total_food_items,
      total_price: total_price
    }
  end
end
