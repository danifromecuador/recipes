class RecipeFood < ApplicationRecord
  validates :recipe_id, uniqueness: { scope: :food_id, message: "already exists for this recipe." }

  belongs_to :recipe
  belongs_to :food
end
