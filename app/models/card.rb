class Card < ActiveRecord::Base
  #validate presence
  validates :original_text, presence: true
  validates :translated_text, presence: true
  #validate unequalness
  validate :unequalness

  def unequalness
    if original_text == translated_text
      errors[:base] << "Оригинал и перевод не могут совпадать!"
    end
  end
end
