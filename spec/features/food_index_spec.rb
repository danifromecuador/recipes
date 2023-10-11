require 'rails_helper'

RSpec.feature 'Food Index Page', type: :feature do
  let(:user) { create(:user, confirmed_at: Time.now) }

  before do
    @food1 = create(:food, name: 'Food 1', user: user)
    @food2 = create(:food, name: 'Food 2', user: user)

    sign_in user
  end

  scenario 'displays the food list for the current user' do
    visit foods_path

    expect(page).to have_content(@food1.name)
    expect(page).to have_content(@food2.name)
  end
end

