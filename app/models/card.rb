class Card < ActiveRecord::Base
  validates :original_text, :translated_text, presence: true
  validate :unequal

  def unequal
    if original_text == translated_text
      errors[:base] << "Оригинал и перевод не могут совпадать!"
    end
  end
end
