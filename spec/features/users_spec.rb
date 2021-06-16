require 'rails_helper'
require 'webdrivers'

describe 'User index', js: true do
  it 'show the user index page' do
    visit users_path
  end
end