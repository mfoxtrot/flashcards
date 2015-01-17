require 'rails_helper'
require 'support/login_helper'

describe "The main page: " do
  let!(:user) { FactoryGirl.create(:user) }

  before(:each) do
    login("me@gmail.com","secret")
  end

  it "Has slogan after log in" do
    visit root_path
  end

end
