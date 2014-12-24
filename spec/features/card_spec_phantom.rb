require 'rails_helper'
require 'capybara/poltergeist'

describe 'Test the main page', js: true do

  it 'Main page shoes the original text to check the translation' do
    card = FactoryGirl.create(:card)
    visit root_path
    expect(page).to have_content card.original_text
  end
end
