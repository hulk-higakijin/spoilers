class Comment < ApplicationRecord
  acts_as_paranoid

  belongs_to :user, -> { with_deleted }, inverse_of: :comments
  belongs_to :discussion

  validates :content, presence: true, length: { maximum: 100 }
end
