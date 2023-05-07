class Discussion < ApplicationRecord
  acts_as_paranoid

  belongs_to :anime
  belongs_to :user

  has_many :comments, dependent: :destroy
end
