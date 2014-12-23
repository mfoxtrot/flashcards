require 'rails_helper'
require 'capybara/poltergeist'

describe 'Test the main page', js: true do

  it 'Make a screenshot' do
    card = FactoryGirl.create(:card)
    visit(root_path)
    page.save_screenshot('tmp/screenshots/main_page.png', full: true)
  end

  it 'Main page shoes the original text to check the translation' do
    card = FactoryGirl.create(:card)
    visit(root_path)
    expect(page).to have_content card.original_text
  end
end
