FactoryBot.define do
  factory :book do
    title { 'テストの本' }
    association :user, factory: :user
  end
end
