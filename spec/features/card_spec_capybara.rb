require 'rails_helper'

describe "The main page: ", js: true do

  it "Has slogan" do
    visit root_path
    expect(page).to have_content "Первый в мире удобный менеджер флеш-карточек. Именно так."
  end

  describe "Allows to test translation and " do

    before(:each) do
      @card = FactoryGirl.create(:card)
      visit root_path
    end

    context do

      it "Shows the original text to check translation" do
        expect(page).to have_content @card.original_text
      end

      it "Returns OK when the translation is correct" do
        fill_in "answer", with: @card.translated_text
        click_button "Проверить"
        expect(page).to have_content "Правильно"
      end

      it "Returns error when the translation is incorrect" do
        fill_in "answer", with: 'mana-mana'
        click_button "Проверить"
        expect(page).to have_content "Не правильно"
      end
    end
  end
end
