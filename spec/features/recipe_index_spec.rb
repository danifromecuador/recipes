require 'rails_helper'

RSpec.feature 'Recipes Index Page', type: :feature do
  let(:user) { create(:user, confirmed_at: Time.now) }
  let!(:recipe1) { create(:recipe, name: 'Recipe 1', description: 'Description 1', user:) }
  let!(:recipe2) { create(:recipe, name: 'Recipe 2', description: 'Description 2', user:) }

  before do
    sign_in user
    visit recipes_path
  end

  scenario 'displays a list of recipes with their names and descriptions' do
    within ".recipe[data-id='#{recipe1.id}']" do
      expect(page).to have_content(recipe1.name)
      expect(page).to have_content(recipe1.description)
    end

    within ".recipe[data-id='#{recipe2.id}']" do
      expect(page).to have_content(recipe2.name)
      expect(page).to have_content(recipe2.description)
    end
  end

  scenario 'allows a user to remove their own recipe' do
    within ".recipe[data-id='#{recipe1.id}']" do
      expect(page).to have_content(recipe1.name)
      expect(page).to have_content(recipe1.description)
    end
  end

  scenario "does not allow a user to remove another user's recipe" do
    within ".recipe[data-id='#{recipe2.id}']" do
      expect(page).to have_content(recipe2.name)
      expect(page).to have_content(recipe2.description)
    end
  end
end
