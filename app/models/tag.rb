class Tag < ApplicationRecord
  # ASSOCIATION
  has_many :book_tags, dependent: :destroy, foreign_key: 'tag_id'
  has_many :books, through: :book_tags
end

# == Schema Information
#
# Table name: tags
#
#  id         :bigint           not null, primary key
#  title      :string(191)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
