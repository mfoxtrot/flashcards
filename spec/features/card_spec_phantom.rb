require 'rails_helper'
require 'capybara/poltergeist'
include Capybara::DSL


describe 'Test the main page', js: true do

  it 'Make a screenshot' do
    card = FactoryGirl.create(:card)
    visit(root_path)
    page.save_screenshot('tmp/screenshots/main_page.png', full: true)
  end

  it 'Main page shoes the original text to check the translation' do
    card = FactoryGirl.create(:card)
    visit(root_path)
  end
end
