module BooksHelper
  def book_tags(book)
    display = ''
    book.tags.each do |tag|
      display += tag.title + ', '
    end
    display.delete_suffix(', ')
  end
end
