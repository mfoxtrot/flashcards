class Card < ActiveRecord::Base
  validates :original_text, :translated_text, presence: true
  validate :original_not_equal_translation
  validates_length_of :original_text, minimum: 1
  validates_length_of :translated_text, minimum: 1
  validates_format_of :original_text, with: /[ a-zA-Zа-яА-Я\s]/, message: "Оригинал не содержит ни одной буквы!"
  validates_format_of :translated_text, with: /[ a-zA-Zа-яА-Я\s]/, message: "Перевод не содержит ни одной буквы!"

  def original_not_equal_translation
    if original_text.mb_chars.downcase.to_s == translated_text.mb_chars.downcase.to_s
      errors[:base] << "Оригинал и перевод не могут совпадать!"
    end
  end

  scope :unreviewed, -> { where('review_date <= ?', Date.today).order("RANDOM()") }

  def check_translation(answer)
    if translated_text.mb_chars.downcase.to_s == answer.mb_chars.downcase.to_s
      update(review_date: 3.days.since)
      return true
    else
      return false
    end
  end
end
