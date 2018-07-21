class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :book_id

      t.timestamps

      t.index :user_id
      t.index :book_id
      t.index [:user_id, :book_id], unique: true
      # user_idとbook_idの組み合わせが必ず一意であることを保証し、１ユーザが同じブックに複数回いいねすることを防ぎます。
    end
  end
end
