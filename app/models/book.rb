class Book < ApplicationRecord

  def self.search(search) #self.でクラスメソッドとしている
    if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
      Book.where(['title LIKE ?', "%#{search}%"])
    else
      Book.all #全て表示。
    end
  end

  belongs_to :user
  has_many :book_comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user

  validates_presence_of :title
  validates_presence_of :body
  validates :body, length: { maximum: 200 }

  # ブックをいいねする
  def like(user)
    likes.create(user_id: user.id)
  end

  # ブックのいいねを解除する
  def like_destroy(user)
    likes.find_by(user_id: user.id).destroy
  end

  # 現在のユーザーがいいねしてたらtrueを返す
  def like?(user)
    like_users.include?(user)
  end

end
