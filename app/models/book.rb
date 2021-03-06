# frozen_string_literal: true

class Book < ApplicationRecord
<<<<<<< Updated upstream
  # VALIDATE
  validates :title, presence: true

  # ASSOCIATION
  belongs_to :user
  has_many :book_tags, dependent: :destroy
  has_many :tags, through: :book_tags
  has_one_attached :image

  scope :recent, -> { order(created_at: :desc) }

  def tags_save(tag_list)
    # すでにタグ登録していた場合、bookとの紐付けをリセットする
    unless tags.nil?
      book_tags_records = BookTag.where(book_id: id)
      book_tags_records.destroy_all
    end

    # 最初と最後にスペースがあれば削除
    tag_list.each do |tag|
      tag.slice!(0) if tag[0] == ' '
      tag.slice!(-1) if tag[-1] == ' '
    end

    tag_list.each do |tag|
      inspected_tag = Tag.where(title: tag).first_or_create
      tags << inspected_tag
    end
  end
=======
  validates :title, presence: true
>>>>>>> Stashed changes
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
