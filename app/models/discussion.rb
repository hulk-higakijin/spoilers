class Discussion < ApplicationRecord
  acts_as_paranoid

  belongs_to :anime
  belongs_to :user

  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: { maximum: 30 }
end
