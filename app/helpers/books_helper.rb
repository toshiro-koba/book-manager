# frozen_string_literal: true

module BooksHelper
  def display_tags(tags)
    display = ''
    tags.each do |tag|
      display += "#{tag.title},"
    end
    display.delete_suffix(',')
  end
end
