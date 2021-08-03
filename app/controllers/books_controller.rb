# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :set_book, only: %i[show edit update destroy]

  def index
    # @books = current_user.books.recent
    @books = current_user.books.eager_load(:tags).with_attached_image.recent
  end

  def show; end

  def new
    @book = Book.new
  end

  def create
    @book = current_user.books.new(book_parms)
    tag_list = params[:book][:booktags].split(',')

    if @book.save
      @book.tags_save(tag_list)
      redirect_to @book, notice: "書籍「#{@book.title}」を登録しました"
    else
      render :new
    end
  end

  def edit; end

  def update
    tag_list = params[:book][:booktags].split(',')
    @book.update!(book_parms)
    @book.tags_save(tag_list)
    redirect_to books_url, notice: "書籍「#{@book.title}」を更新しました。"
  end

  def destroy
    @book.destroy
    redirect_to books_url, notice: "書籍「#{@book.title}」を削除しました。"
  end

  private

    def book_parms
      params.require(:book).permit(:title, :image)
    end

    def set_book
      @book = current_user.books.find(params[:id])
      # test
      # test_2
    end
end
