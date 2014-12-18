require 'spec_helper'

describe Card do

  it "Save new Card when all fields are correct" do
    newcard = Card.new(original_text: "Hi", translated_text: "Привет", review_date: "01.01.2014")
    expect{newcard.save}.not_to raise_error
  end

  it "Throw an error when original_text doesn't include any letter" do
    newcard = Card.new(original_text: "1234...!${%@#", translated_text: "abc", review_date: "01.01.2014")
    expect(newcard).not_to be_valid
  end

  it "Throw an error when translated_text doesn't include any letter" do
    newcard = Card.new(original_text: "Yesterday", translated_text: "&)*)1243508", review_date: "01.01.2014")
    expect(newcard).not_to be_valid
  end

  it "Throw an error when original_text is nil" do
    newcard = Card.new(original_text: nil, translated_text: "abc", review_date: "01.01.2014")
    expect{newcard.save}.to raise_error
  end

  it "Throw an error when original_text is zero-length" do
    newcard = Card.new(original_text: "", translated_text: "abc", review_date: "01.01.2014")
    expect(newcard).not_to be_valid
  end

  it "Throw an error when translated_text is nil" do
    newcard = Card.new(original_text: "ABC", translated_text: nil, review_date: "01.01.2014")
    expect{newcard.save}.to raise_error
  end

  it "Throw an error when translated_text is zero-length" do
    newcard = Card.new(original_text: "ABC", translated_text: "", review_date: "01.01.2014")
    expect(newcard).not_to be_valid
  end

  it "Throw an error when translated and original texts are equal latin_LowerCase" do
    newcard = Card.new(original_text: "abc", translated_text: "abc", review_date: "01.01.2014")
    expect(newcard).not_to be_valid
  end

  it "Throw an error when translated and original texts are equal latin_UpperCase" do
    newcard = Card.new(original_text: "ABC", translated_text: "ABC", review_date: "01.01.2014")
    expect(newcard).not_to be_valid
  end

  it "Throw an error when translated and original texts are equal latin_CamelCase" do
    newcard = Card.new(original_text: "AbC", translated_text: "AbC", review_date: "01.01.2014")
    expect(newcard).not_to be_valid
  end

  it "Throw an error when translated and original texts are equal Cyrillic_LowerCase" do
    newcard = Card.new(original_text: "абв", translated_text: "абв", review_date: "01.01.2014")
    expect(newcard).not_to be_valid
  end

  it "Throw an error when translated and original texts are equal Cyrillic_UpperCase" do
    newcard = Card.new(original_text: "АБВ", translated_text: "АБВ", review_date: "01.01.2014")
    expect(newcard).not_to be_valid
  end

  it "Throw an error when translated and original texts are equal Cyrillic_CamelCase" do
    newcard = Card.new(original_text: "АбВ", translated_text: "АбВ", review_date: "01.01.2014")
    expect(newcard).not_to be_valid
  end

  it "Should have letters" do
    newcard = Card.new(original_text: "АбВ", translated_text: "АбВ", review_date: "01.01.2014")
    expect(newcard).not_to be_valid
  end

  it "Should return (check_translatrion=true) when translation is correct" do
    newcard = Card.new(original_text: "Nice", translated_text: "Хорошо", review_date: "01.01.2014")
    result = newcard.check_translation("Хорошо")
    expect(result).to be true
    #expect{newcard.check_translation("Хорош")}.to be true #|| expect(newcard.review_date).to eq(3.days.since)
  end

  it "Should update review_date when translation is correct" do
    newcard = Card.new(original_text: "Nice", translated_text: "Хорошо", review_date: "01.01.2014")
    newcard.check_translation("Хорошо")
    expect(newcard.review_date).to eq(3.days.since)
    #expect{newcard.check_translation("Хорош")}.to be true #|| expect(newcard.review_date).to eq(3.days.since)
  end
end
