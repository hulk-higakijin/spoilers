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
  validates :image_url, format: /\A#{URI::DEFAULT_PARSER.make_regexp(%w[http https])}\z/
  validates :web_url, format: /\A#{URI::DEFAULT_PARSER.make_regexp(%w[http https])}\z/

  enum sex: { men: 0, women: 1, other: 2 }
  enum season: { spring: 0, summer: 1, fall: 2, winter: 3 }

  def display_image_url
    if image_url.blank? || image_url == '-'
      default_image_url
    else
      image_url
    end
  end

  def default_image_url
    'https://pbs.twimg.com/profile_images/1639996872071974913/PPhYEW-B_400x400.jpg'
  end
end
