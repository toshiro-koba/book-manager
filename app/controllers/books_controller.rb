class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
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
  end

  private

  def book_parms
    params.require(:book).permit(:title)
  end
end
