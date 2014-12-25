class User < ActiveRecord::Base
  validates :email, :password, presence: true, length: { minimum: 1 }
  has_many :cards
end
