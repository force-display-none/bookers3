class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @users = User.search(params[:search])
    @book = Book.new
  end

  def show
  	@user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
    redirect_to user_path(current_user) unless @user == current_user
  end

  def update #エラーを表示するためにインスタンス変数を使っています
  	@user = current_user
  	if @user.update(user_params)
  	  redirect_to @user, notice: "User info updated successfully"
    else
      render :edit
    end
  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following
    #.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers
    #.paginate(page: params[:page])
    render 'show_follow'
  end

  private

    def user_params
      params.require(:user).permit(:name, :introduction, :image)
    end

end
