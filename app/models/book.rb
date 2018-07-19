class Book < ApplicationRecord

  belongs_to :user

  validates_presence_of :title
  validates_presence_of :body
  validates :body, length: { maximum: 200 }
end
