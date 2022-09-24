class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
   	if @book.save
   	  redirect_to user_path(@book), notice: 'book was successfully created.'
   	else
   	  @books = @user.books
   	  render 'index'
   	end
  end
  def show
    @user = User.find(params[:id])
    @book = Book.new
    # @book.user_id = current_user.id
    @books = @user.books  
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
     	  redirect_to user_path, notice: "You have updated user successfully."
    else
      render :edit
    end  
  end

  def index
    @users = User.all
    @book = Book.new
    @user = User.find(current_user.id)
  end
  
   private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
  
end
