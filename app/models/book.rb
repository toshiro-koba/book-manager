class Book < ApplicationRecord
  validates :title, presence: true

  belongs_to :user

  scope :recent, -> { order(created_at: :desc) }
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
