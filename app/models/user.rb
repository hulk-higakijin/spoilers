class User < ApplicationRecord
  acts_as_paranoid

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :discussions, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, presence: true, length: { in: 3..15 }
  validates :email, presence: true, uniqueness: true

  def display_avatar
    avatar.attached? ? avatar : default_image
  end

  def default_image
    'https://pbs.twimg.com/profile_images/1639996872071974913/PPhYEW-B_400x400.jpg'
  end
end
