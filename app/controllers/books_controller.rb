class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = current_user.books.recent
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    @book = current_user.books.new(book_parms)
    if @book.save
      redirect_to @book, notice: "書籍「#{@book.title}」を登録しました"
    else
      render :new
    end
  end

  def edit
  end

  def update
    @book.update!(book_parms)
    redirect_to books_url, notice: "書籍「#{@book.title}」を更新しました。"
  end

  def destroy
    @book.destroy
    redirect_to books_url, notice: "書籍「#{@book.title}」を削除しました。"
  end

  private

  def book_parms
    params.require(:book).permit(:title)
  end

  def set_book
    @book = current_user.books.find(params[:id])
  end
end
