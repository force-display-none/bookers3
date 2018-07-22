class LikesController < ApplicationController
  before_action :authenticate_user!
  def create
  	@book = Book.find(params[book_id])
  	@book.like(current_user)
  end

  def destroy
  	@book = Like.find(params[:id]).book
  	@book.like_destroy(current_user)
  end
end
