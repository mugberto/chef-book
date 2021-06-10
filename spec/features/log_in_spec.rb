require 'rails_helper'

RSpec.feature 'LogIns', type: :feature do
  before :each do
    current_user = User.create(username: 'existingusername', fullname: 'Existing User')
  end

  scenario 'Expected to succeed if the username exists' do
    visit new_session_path
    within 'form' do
      fill_in 'user_username', with: 'existingusername'
      click_button 'Sign in'
    end
    expect(page).to have_content 'Logged in successfully'
  end

  scenario 'Expected to fail if user does not exist' do
    visit new_session_path
    within 'form' do
      fill_in 'user_username', with: 'notexistingusername'
      click_button 'Sign in'
    end
    expect(page).to have_content 'Sign in failed!'
  end
end
