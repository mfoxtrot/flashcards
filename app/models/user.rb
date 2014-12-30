class User < ActiveRecord::Base
  #  attr_accessible :email, :password, :password_confirmation, :authentications_attributes
  attr_accessor :external

  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication
  end

  validates :password, length: { minimum: 3 }, unless: -> { @external }
  validates :password, confirmation: true, unless: -> { @external }
  validates :password_confirmation, presence: true, unless: -> { @external }

  validates :email, uniqueness: true
  validates_email_format_of :email, message: "Некорректный адрес эл.почты", unless: -> { @external }

  has_many :cards

  has_many :authentications, dependent: :destroy
  accepts_nested_attributes_for :authentications

end
