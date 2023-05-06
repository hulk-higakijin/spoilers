class Discussion < ApplicationRecord
  belongs_to :anime
  belongs_to :user

  has_many :comments, dependent: :destroy
end
