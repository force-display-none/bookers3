class User < ApplicationRecord

  def self.search(search) #self.でクラスメソッドとしている
    if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
      User.where(['name LIKE ?', "%#{search}%"])
    else
      User.all #全て表示。
    end
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :books, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  attachment :image

  validates_uniqueness_of :name
  validates_presence_of :name
  validates :name, length: { in: 2..20 }
  validates :introduction, length: { maximum: 50 }

  def email_required?
  	false
  end

  def email_changed?
  	false
  end
end
