require 'rails_helper'

RSpec.feature 'SignUps', type: :feature do
  before :each do
    User.create(username: 'existingusername', fullname: 'Existing User')
  end

  scenario 'Expected to succeed if a username and fullname are entered' do
    visit new_user_path
    within 'form' do
      fill_in 'user_username', with: 'myusername'
      fill_in 'user_fullname', with: 'My Full Name'
      click_button 'Sign up'
    end
    expect(page).to have_content 'Signed up successfully'
  end

  scenario 'Expected to fail if a fullname or usename not given' do
    visit new_user_path
    within 'form' do
      fill_in 'user_username', with: ''
      fill_in 'user_fullname', with: 'My Full Name'
      click_button 'Sign up'
    end
    expect(page).to have_content 'Sign up not successful'
  end

  scenario 'Expected to fail if the username is taken' do
    visit new_user_path
    within 'form' do
      fill_in 'user_username', with: 'existingusername'
      fill_in 'user_fullname', with: 'My Full Name'
      click_button 'Sign up'
    end
    expect(page).to have_content 'Sign up not successful'
  end
end
