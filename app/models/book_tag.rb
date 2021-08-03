# frozen_string_literal: true

class BookTag < ApplicationRecord
  # VALIDATE
  validates :book_id, presence: true
  validates :tag_id, presence: true

  # ASSOCIATION
  belongs_to :book
  belongs_to :tag
end

# == Schema Information
#
# Table name: book_tags
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  book_id    :bigint
#  tag_id     :bigint
#
# Indexes
#
#  index_book_tags_on_book_id  (book_id)
#  index_book_tags_on_tag_id   (tag_id)
#
# Foreign Keys
#
#  fk_rails_...  (book_id => books.id)
#  fk_rails_...  (tag_id => tags.id)
#
