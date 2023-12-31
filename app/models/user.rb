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
    user_food_list = Food.where(user_id: id)
    missing_food_list = {}
    total_food_items = 0
    total_price = 0
    recipes.each do |recipe|
      missing_foods, recipe_total_price = find_missing_foods_and_price(user_food_list, recipe)
      update_missing_food_list(missing_foods, recipe.id, missing_food_list)
      total_price += recipe_total_price
      total_food_items += missing_foods.count
    end
    update_user_food_list(user_food_list, missing_food_list)
    shopping_list = generate_shopping_list_from_missing(missing_food_list)
    { shopping_list:, total_food_items:, total_price: }
  end

  private

  def update_missing_food_list(missing_foods, recipe_id, missing_food_list)
    missing_foods.each do |food|
      quantity_to_buy = food.recipe_foods.find_by(recipe_id:).quantity
      if missing_food_list[food.id]
        missing_food_list[food.id][:quantity_to_buy] += quantity_to_buy
      else
        missing_food_list[food.id] = { food:, quantity_to_buy: }
      end
    end
  end

  def update_user_food_list(user_food_list, missing_food_list)
    user_food_list.each do |user_food|
      missing_food_list[user_food.id][:quantity_to_buy] -= user_food.quantity if missing_food_list[user_food.id]
    end
  end

  def generate_shopping_list_from_missing(missing_food_list)
    missing_food_list.map do |_, food|
      { food: food[:food], quantity: food[:quantity_to_buy], price: food[:quantity_to_buy] * food[:food].price }
    end
  end

  def find_missing_foods_and_price(user_food_list, recipe)
    missing_foods = []
    recipe_total_price = 0
    recipe.foods.each do |food|
      user_food = user_food_list.find(food.id)
      next if user_food.quantity >= food.recipe_foods.find_by(recipe_id: recipe.id).quantity

      missing_foods << food
      quantity_to_buy = food.recipe_foods.find_by(recipe_id: recipe.id).quantity - user_food.quantity
      recipe_total_price += quantity_to_buy * food.price
    end
    [missing_foods, recipe_total_price]
  end

  def create_shopping_list(recipe_ids, user_food_list, missing_food_list)
    shopping_list = []
    missing_food_list.each do |food|
      recipe_food = food.recipe_foods.find_by(recipe_id: recipe_ids)
      next unless recipe_food

      quantity_to_buy = recipe_food.quantity - user_food_list.find(food.id).quantity
      price = quantity_to_buy * food.price
      shopping_list << { food:, quantity: quantity_to_buy, price: }
    end
    shopping_list
  end
end
