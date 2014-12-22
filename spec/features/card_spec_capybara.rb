require 'spec_helper'
require 'rails_helper'

describe "The main page: ", type: :feature do


  it "Opens homepage" do
    visit(root_path)
  end

  it "Has check translation button" do
    visit(root_path)

  end
end
