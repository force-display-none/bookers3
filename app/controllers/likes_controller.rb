class LikesController < ApplicationController
  before_action :authenticate_user!
  def create
    likes = Like.where(book_id: params[:book_id])
  	book_show = Book.find(params[:book_id])
  	book_show.like(current_user)
    book_show.reload
  	respond_to do |format|
  	  format.html { redirect_to book_path(book_show) || root_url }
  	  format.js
      redirect_to book_path(book_show)
  	end
  end

  def destroy
  	book_show = Like.find(params[:id]).book
  	book_show.like_destroy(current_user)
    book_show.reload
  	respond_to do |format|
  	  format.html { redirect_to book_path(book_show) || root_url }
  	  format.js
    redirect_to book_path(book_show)
  	end
  end

end
