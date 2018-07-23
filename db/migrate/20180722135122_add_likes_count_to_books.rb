class AddLikesCountToBooks < ActiveRecord::Migration[5.2]
  # def change
  #   add_column :books, :likes_count, :integer
  # end

  class MigrationUser < ApplicationRecord
    self.table_name = :books
  end

  def up
    _up
  rescue => e
    _down
    raise e
  end

  def down
    _down
  end

  private

  def _up
    MigrationUser.reset_column_information

    add_column :books, :likes_count, :integer, null: false, default: 0 unless column_exists? :books, :likes_count
  end

  def _down
    MigrationUser.reset_column_information

    remove_column :books, :likes_count if column_exists? :books, :likes_count
  end

end
