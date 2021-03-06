# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    title { 'テストの本' }
    association :user, factory: :user
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
