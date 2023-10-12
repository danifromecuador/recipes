require 'rails_helper'

RSpec.feature 'Recipe Show Page', type: :feature do
  let(:user) { create(:user, confirmed_at: Time.now) }
  let!(:recipe) do
    create(:recipe, name: 'Test Recipe', preparation_time: 30, cooking_time: 45, description: 'Test Description',
                    public: true, user:)
  end
  let(:user) { create(:user) }

  scenario 'displays recipe details' do
    visit recipe_path(recipe)

    expect(page).to have_content(recipe.name)
    expect(page).to have_content("Preparation Time: #{recipe.preparation_time} minutes")
    expect(page).to have_content("Cooking Time: #{recipe.cooking_time} minutes")
    expect(page).to have_content("Description: #{recipe.description}")

    expect(page).to have_button('Public') or have_button('Private')
    expect(page).to have_link('Generate Shopping List', href: shopping_list_path)
    expect(page).to have_link('Add Ingredient', href: new_recipe_food_path(recipe_id: recipe.id))

    within '.ingredients-container' do
      recipe.recipe_foods.each do |recipe_food|
        expect(page).to have_content(recipe_food.food.name)
        expect(page).to have_content("(#{recipe_food.quantity} units)")
      end
    end
  end
end
