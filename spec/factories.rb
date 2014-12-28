FactoryGirl.define do
  factory :card do
    original_text "Hi"
    translated_text "Привет"
    review_date "01.01.2014"
    user
  end

  factory :user do
    email "johhdoe@gmail.com"
    password "123"
  end
end
