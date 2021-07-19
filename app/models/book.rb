class Book < ApplicationRecord
  validates :title, presence: true

  belongs_to :user

  scope :recent, -> { order(created_at: :desc) }
end
