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

  def display_name
    paranoia_destroyed? ? '削除済みユーザー' : name
  end

  def display_avatar
    return withdrawn_image if paranoia_destroyed?
    return avatar if avatar.attached?

    default_image
  end

  private

    def withdrawn_image
      'https://jsbs2012.jp/wp-content/uploads/pairs_taikaisya.jpg'
    end

    def default_image
      'https://pbs.twimg.com/profile_images/1639996872071974913/PPhYEW-B_400x400.jpg'
    end
end
