class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @users = User.all
    @book = Book.new
  end

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render "edit"
    else
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @books = Book.all
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to user_path(current_user.id), notice: 'You have updated user successfully.'
    else
      render :edit
    end
  end

# params[:id]

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end