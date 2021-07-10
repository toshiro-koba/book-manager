class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    book = Book.new(book_parms)
    book.save!
    redirect_to books_url, notice: "書籍「#{book.title}」を登録しました"
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update!(book_parms)
    redirect_to books_url, notice: "書籍「#{book.title}」を更新しました。"
  end

  private

  def book_parms
    params.require(:book).permit(:title)
  end
end
