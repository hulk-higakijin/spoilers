class Anime < ApplicationRecord
  has_many :discussions, dependent: :destroy

  validates :title, presence: true, length: { maximum: 100 }
  validates :title_first, length: { maximum: 50 }
  validates :title_second, length: { maximum: 50 }
  validates :title_third, length: { maximum: 50 }
  validates :title_en, length: { maximum: 100 }
  validates :sex, presence: true
  validates :year, presence: true, numericality: { in: 1900..2100 }
  validates :season, presence: true

  enum sex: { man: 0, woman: 1, other: 2 }
  enum season: { spring: 0, summer: 1, fall: 2, winter: 3 }
end
