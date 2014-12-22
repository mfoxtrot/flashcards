require 'spec_helper'
require 'rails_helper'

describe "The main page: ", type: :feature do

  it "Opens homepage" do
    visit(root_path)
    page.should have_content "Первый в мире удобный менеджер флеш-карточек. Именно так."
  end

  it "Checks the translation" do
    card = create(:card)
    visit(root_path)
    fill_in "answer", with: card.translated_text
    click_button "Проверить"
    page.should have_content "Правильно"
  end
end
