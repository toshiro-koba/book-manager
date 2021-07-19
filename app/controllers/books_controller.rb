class BooksController < ApplicationController
  def index
    @books = current_user.books.order(id: "DESC")
  end

  def show
    @book = current_user.books.find(params[:id])
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
    @book = current_user.books.find(params[:id])
  end

  def update
    book = current_user.books.find(params[:id])
    book.update!(book_parms)
    redirect_to books_url, notice: "書籍「#{book.title}」を更新しました。"
  end

  def destroy
    book = current_user.books.find(params[:id])
    book.destroy
    redirect_to books_url, notice: "書籍「#{book.title}」を削除しました。"
  end

  private

  def book_parms
    params.require(:book).permit(:title)
  end
end
