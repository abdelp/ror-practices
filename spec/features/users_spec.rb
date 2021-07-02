require 'rails_helper'
require 'webdrivers'

describe 'User index', js: true do
  it 'show the user index page' do
    visit users_path
    expect(page).to have_current_path(users_path)
    click_link 'New User'
    expect(page).to have_current_path(new_user_path)
    click_button 'Create User'
  end
end

