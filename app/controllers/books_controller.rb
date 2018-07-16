class BooksController < ApplicationController

  def create
  	book = Book.new(book_params)
    if book.save
      redirect_to book_path(book.id)
    else
      render 'index'
    end
  end

  def index
  	@books = Book.all
  end

  def show
  end

  # def edit
  # 	@book = book.find(params[:id])
  # 	if @book.user_id != current_user.id
  # 	  redirect_to book_path(@book.id)
  # 	end
  # end

    private

      def book_params
        params.require(:book).permit(:title, :body)
      end

end



