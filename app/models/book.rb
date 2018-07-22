class Book < ApplicationRecord

  belongs_to :user
  has_many :book_comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user

  validates_presence_of :title
  validates_presence_of :body
  validates :body, length: { maximum: 200 }

  # 現在のユーザーがいいねしてたらtrueを返す
  def like?(user)
  	like_users.include?(user)
  end
end
