require 'spec_helper'

describe Card do

  it "Is invalid when original and translation are equal" do
    newcard = Card.new(original_text: "abc", translated_text: "abc", review_date: "01.01.2014")
    expect{newcard.save}.to raise_error
  end
end
