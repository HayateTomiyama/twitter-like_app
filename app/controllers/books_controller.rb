class BooksController < ApplicationController

  def new
  end

   # 投稿データの保存
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @user = @book.user
   	if @book.save
   	  redirect_to book_path(@book), notice: 'book was successfully created.'
   	else
   	  @books = Book.all
   	  render 'index'
   	end
  end

  def index
    @book = Book.new
    @book.user_id = current_user.id
    @books = Book.all
    @user = User.find(current_user.id)
  end

  def show
    @book = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
     	  redirect_to book_path, notice: "Book was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path, notice: "Book was successfully destroyed."
  end

  # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:body, :title)
  end

end
