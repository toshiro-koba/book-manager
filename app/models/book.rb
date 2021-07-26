class Book < ApplicationRecord
  # VALIDATE
  validates :title, presence: true

  # ASSOCIATION
  belongs_to :user
  has_many :book_tags, dependent: :destroy
  has_many :tags, through: :book_tags

  scope :recent, -> { order(created_at: :desc) }

  def tags_save(tag_list)
    # すでにタグ登録していた場合、bookとの紐付けをリセットする
    if self.tags != nil
      book_tags_records = BookTag.where(book_id: self.id)
      book_tags_records.destroy_all
    end

    tag_list.each do |tag|
      inspected_tag = Tag.where(title: tag).first_or_create
      self.tags << inspected_tag
    end
  end
end

# == Schema Information
#
# Table name: books
#
#  id         :bigint           not null, primary key
#  title      :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_books_on_user_id  (user_id)
#
