class Anime < ApplicationRecord
  has_many :discussions, dependent: :destroy
end
