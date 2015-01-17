require 'rails_helper'

describe User do

  it "Saves new user when all fields are correct" do
    new_user = User.new(email: "johndoe1@gmail.com", password: "12345", password_confirmation: "12345", salt: "123")
    expect(new_user).to be_valid
  end

  it "Is not valid when email doesn't present" do
    new_user = User.new(password: "12345", password_confirmation: "12345", salt: "123")
    expect(new_user).not_to be_valid
  end

  it "Is not valid when password doesn't present" do
    new_user = User.new(email: "johndoe2@gmail.com")
    expect(new_user).not_to be_valid
  end

  it "Is not valid when password's length less than 3" do
    new_user = User.new(email: "johndoe3@gmail.com", password: "12", password_confirmation: "12", salt: "123")
    expect(new_user).not_to be_valid
  end

  it "Is not valid when entered email doesn't match email format" do
    new_user = User.new(email: "johndoe4@gmail", password: "1234", password_confirmation: "1234", salt: "123")
    expect(new_user).not_to be_valid
  end

  it "Is not valid when password and confirmation are not equal each other" do
    new_user = User.new(email: "johndoe5@gmail", password: "1234", password_confirmation: "123", salt: "123")
    expect(new_user).not_to be_valid
  end

  it "Is able to have many cards" do
    new_user = User.create(email: "johndoe6@gmail.com", password: "12345", password_confirmation: "12345", salt: "123")
    new_card1 = Card.create(original_text: "hi", translated_text: "привет", review_date: "01.01.2014", user: new_user)
    new_card2 = Card.create(original_text: "bye", translated_text: "пока", review_date: "01.01.2014", user: new_user)
    expect(new_user.cards.count).to eq(2)
  end
end
