require 'rails_helper'
include Capybara::DSL

describe "The main page: ", js: true do

  it "Opens homepage" do
    visit root_path
    expect(page).to have_content "Первый в мире удобный менеджер флеш-карточек. Именно так."
  end

  it "Main page shows the original text to check translation" do
    card = FactoryGirl.create(:card)
    visit root_path
    expect(page).to have_content card.original_text
  end

  it "User's able to check the translation" do
    card = FactoryGirl.create(:card)
    visit root_path
    fill_in "answer", with: card.translated_text
    click_button "Проверить"
    expect(page).to have_content "Правильно"
  end

  it "Returns error when user's translation is incorrect" do
    card = FactoryGirl.create(:card)
    visit root_path
    fill_in "answer", with: ('a'..'z').to_a.shuffle.first(rand(26)).join
    click_button "Проверить"
    expect(page).to have_content "Не правильно"
  end
end
