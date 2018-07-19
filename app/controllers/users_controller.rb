class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end

  def show
  	@user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user)
    end
  end

  def update #エラーを表示するためにインスタンス変数を使っています
  	@user = current_user
  	if @user.update(user_params)
  	  redirect_to @user, notice: "User info updated successfully"
    else
      render 'edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :introduction, :image)
    end

end
