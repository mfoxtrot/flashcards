class Card < ActiveRecord::Base
  validates :original_text, :translated_text, presence: true
  validate :original_not_equal_translation

  def original_not_equal_translation
    if original_text.mb_chars.downcase.to_s == translated_text.mb_chars.downcase.to_s
      errors[:base] << "Оригинал и перевод не могут совпадать!"
    end
  end

  scope :unreviewed_recently, -> { where('review_date < ?', 3.days.ago ) } do
    def random_card
      offset=unreviewed_recently.count
      unreviewed_recently.find(:first, offset: rand(offset))
    end
  end

  def correct_translation?(answer)
    #Есть желание проверку на совпадение двух строк вынести в отдельный библиотечный модуль.
    #Как это лучше сделать?
    if self.translated_text.mb_chars.downcase.to_s == answer.mb_chars.downcase.to_s
      self.review_date = Date.today
      self.save
      return true
    else
      return false
    end
  end
end
