class Card < ActiveRecord::Base
  validates :original_text, :translated_text, presence: true
  validate :original_not_equal_translation

  def original_not_equal_translation
    #Откопал такой код на api.rubyonrails.org, возможно, есть более лаконичное
    #решение.
    if original_text.mb_chars.downcase.to_s == translated_text.mb_chars.downcase.to_s
      errors[:base] << "Оригинал и перевод не могут совпадать!"
    end
  end
end
