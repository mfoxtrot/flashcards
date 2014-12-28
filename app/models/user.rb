class User < ActiveRecord::Base
  validates :email, :password, presence: true, length: { minimum: 1 }
  validates_email_format_of :email, message: "Некорректный адрес эл.почты"
  has_many :cards
end
