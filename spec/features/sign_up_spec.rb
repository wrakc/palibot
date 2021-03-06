require 'rails_helper'

RSpec.describe 'Sign up', type: :feature do
  before :each do
    User.create(username: 'bender', password: '123456', email: 'bender@futurama.com')
    Category.create(id: 1, name: 'test', priority: 1)
    user.articles.new(id: 1, title: 'Title', content: 'Anything', created_at: DateTime.now,
                      updated_at: DateTime.now, image: File.new(Rails.root.join('public', 'test_image.png')),
                      user_id: 1, category_id: 1)

    scenario 'Sign up' do
      visit new_user_registration_path
      fill_in 'user[username]', with: 'bender'
      fill_in 'user[email]', with: 'bender@futurama.com'
      fill_in 'user[password]', with: '123456'
      fill_in 'user[password_confirmation]', with: '123456'
      click_button 'Sign Up'
      expect(page).to have_current_path(root_path)
      expect(page).to have_content('Welcome! You have signed up successfully.')
    end

    scenario 'Pasword confirmation does not match' do
      visit new_user_registration_path
      fill_in 'user[username]', with: 'test'
      fill_in 'user[email]', with: 'test@test.com'
      fill_in 'user[password]', with: '123456'
      fill_in 'user[password_confirmation]', with: '12345'
      click_button 'Sign Up'
      expect(page).to have_content("Password confirmation doesn't match Password")
    end
  end
end
