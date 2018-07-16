class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :books, dependent: :destroy
  attachment :image

  validates_uniqueness_of :name
  validates_presence_of :name

  def email_required?
  	false
  end

  def email_changed?
  	false
  end
end
