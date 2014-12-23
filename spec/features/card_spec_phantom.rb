require 'spec_helper'
require 'rails_helper'
require 'capybara/poltergeist'
include Capybara::DSL


describe 'Test the main page', type: :feature, js: true do
  it 'Make a screenshot' do
    visit(root_path)
    page.save_screenshot('tmp/screenshots/main_page.png', full: true)
  end
end
