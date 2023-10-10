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
      recipe_food = RecipeFood.find_by(recipe_id: recipe.id)
      if recipe_food
        missing_food = user_food_list.where(id: recipe_food.food_id).where("quantity < ?", recipe_food.quantity)
        missing_food_list.concat(missing_food)
      end
    end

    missing_food_list.each do |food|
      recipe_food = RecipeFood.find_by(recipe_id: recipes.pluck(:id), food_id: food.id)
      if recipe_food
        total_food_items += recipe_food.quantity - food.quantity
        total_price += (recipe_food.quantity - food.quantity) * food.price
      end
    end

    {
      missing_food_list: missing_food_list,
      total_food_items: total_food_items,
      total_price: total_price
    }
  end
end
