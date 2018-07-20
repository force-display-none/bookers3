class Book < ApplicationRecord

  belongs_to :user
  has_many :book_comments, dependent: :destroy

  validates_presence_of :title
  validates_presence_of :body
  validates :body, length: { maximum: 200 }
end
