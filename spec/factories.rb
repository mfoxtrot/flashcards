FactoryGirl.define do
  factory :card do
    original_text "Hi"
    translated_text "Привет"
    review_date "01.01.2014"
    user
  end

  factory :user do
    email "me@gmail.com"
    password "secret"
    password_confirmation "secret"
    salt "abcdefghijklmnopqrstuvwxyz"
    crypted_password Sorcery::CryptoProviders::BCrypt.encrypt("secret", "abcdefghijklmnopqrstuvwxyz")
  end
end
