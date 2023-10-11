require 'rails_helper'

RSpec.feature 'Users List Page', type: :feature do
  let!(:user1) do
    create(:user, id: 1, name: 'Tom', email: 'test@example.com', password: '123456', confirmed_at: Time.now)
  end
  let!(:user2) { create(:user, id: 2, name: 'Lili') }

  scenario 'displays user names as links after signing up' do
    visit root_path
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'

    visit users_path

    within 'ul.users-list-container' do
      expect(page).to have_link(user1.name, href: foods_path(user_id: user1.id))
      expect(page).to have_link(user2.name, href: foods_path(user_id: user2.id))
    end
  end
end
