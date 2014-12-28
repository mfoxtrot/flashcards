require 'spec_helper'

describe User do

  it "Saves new user when all fields are correct" do
    new_user = User.new(email: "johndoe@gmail.com", password: "1234567890")
    expect(new_user).to be_valid
  end

  it "Is not valid when email doesn't present" do
    new_user = User.new(password: "1234567890")
    expect(new_user).not_to be_valid
  end

  it "Is not valid when password doesn't present" do
    new_user = User.new(email: "johndoe@gmail.com")
    expect(new_user).not_to be_valid
  end

  it "Is not valid when password's length less than 1" do
    new_user = User.new(email: "johndoe@gmail.com", password: "")
    expect(new_user).not_to be_valid
  end

  it "Is able to have many cards" do
    new_user = User.new(email: "johndoe@gmail.com", password: "12345")
    new_user.save
    new_card1 = Card.new(original_text: "hi", translated_text: "привет", review_date: "01.01.2014", user: new_user)
    new_card1.save
    new_card2 = Card.new(original_text: "bye", translated_text: "пока", review_date: "01.01.2014", user: new_user)
    new_card2.save
    expect(new_user.cards.count).to eq(2)
  end
end
