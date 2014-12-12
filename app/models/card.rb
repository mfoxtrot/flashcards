class Card < ActiveRecord::Base
  validates :original_text, :translated_text, presence: true
  validate :original_not_equal_translation

  def original_not_equal_translation
    if original_text.mb_chars.downcase.to_s == translated_text.mb_chars.downcase.to_s
      errors[:base] << "Оригинал и перевод не могут совпадать!"
    end
  end

  scope :unreviewed_recently, -> { where('review_date <= ?', Date.today) } do
    def random
      unreviewed_recently.first(order: "RANDOM()")
    end
  end

  def check_translation?(answer)
    if translated_text.mb_chars.downcase.to_s == answer.mb_chars.downcase.to_s
      update(review_date: 3.days.since)
      return true
    else
      return false
    end
  end
end
