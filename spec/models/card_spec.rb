require 'spec_helper'

describe Card do

  it "Saves new Card when all fields are correct" do
    new_card = Card.new(original_text: "Hi", translated_text: "Привет", review_date: "01.01.2014", user_id: 1)
    expect{ new_card.save }.not_to raise_error
  end

  it "Throw an error when original_text is nil" do
    new_card = Card.new(original_text: nil, translated_text: "abc", review_date: "01.01.2014", user_id: 1)
    expect{ new_card.save }.to raise_error
  end

  it "Card is invalid when original_text is zero-length" do
    new_card = Card.new(original_text: "", translated_text: "abc", review_date: "01.01.2014", user_id: 1)
    expect(new_card).not_to be_valid
  end

  it "Throw an error when translated_text is nil" do
    new_card = Card.new(original_text: "ABC", translated_text: nil, review_date: "01.01.2014", user_id: 1)
    expect{ new_card.save }.to raise_error
  end

  it "Card is invalid when translated_text is zero-length" do
    new_card = Card.new(original_text: "ABC", translated_text: "", review_date: "01.01.2014", user_id: 1)
    expect(new_card).not_to be_valid
  end

  it "Card is invalid when translated and original texts are equal latin_LowerCase" do
    new_card = Card.new(original_text: "abc", translated_text: "abc", review_date: "01.01.2014", user_id: 1)
    expect(new_card).not_to be_valid
  end

  it "Card is invalid when translated and original texts are equal latin_UpperCase" do
    new_card = Card.new(original_text: "ABC", translated_text: "ABC", review_date: "01.01.2014")
    expect(new_card).not_to be_valid
  end

  it "Card is invalid when translated and original texts are equal latin_CamelCase" do
    new_card = Card.new(original_text: "AbC", translated_text: "AbC", review_date: "01.01.2014")
    expect(new_card).not_to be_valid
  end

  it "Card is invalid when translated and original texts are equal Cyrillic_LowerCase" do
    new_card = Card.new(original_text: "абв", translated_text: "абв", review_date: "01.01.2014")
    expect(new_card).not_to be_valid
  end

  it "Card is invalid when translated and original texts are equal Cyrillic_UpperCase" do
    new_card = Card.new(original_text: "АБВ", translated_text: "АБВ", review_date: "01.01.2014")
    expect(new_card).not_to be_valid
  end

  it "Card is invalid when translated and original texts are equal Cyrillic_CamelCase" do
    new_card = Card.new(original_text: "АбВ", translated_text: "АбВ", review_date: "01.01.2014")
    expect(new_card).not_to be_valid
  end

  it "Should have letters" do
    new_card = Card.new(original_text: "АбВ", translated_text: "АбВ", review_date: "01.01.2014")
    expect(new_card).not_to be_valid
  end

  it "Translation check should be successful if translation is correct" do
    new_card = Card.new(original_text: "Nice", translated_text: "Хорошо", review_date: "01.01.2014")
    result = new_card.check_translation("Хорошо")
    expect(result).to be true
  end

  it "Should update review_date when translation is correct" do
    new_card = Card.new(original_text: "Nice", translated_text: "Хорошо", review_date: "01.01.2014")
    new_card.check_translation("Хорошо")
    expect(new_card.review_date).to eq(3.days.since(DateTime.now.utc.to_date))
  end

  it "Should belongs to a user" do
    new_user = User.new(email: "johndoe@gmail.com", password: "123")
    new_card = Card.new(original_text: "hi", translated_text: "привет", review_date: "01.01.2014", user: new_user)
    expect(new_card.user).to be new_user
  end
end
