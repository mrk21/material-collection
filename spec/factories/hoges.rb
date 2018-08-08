FactoryBot.define do
  factory :hoge do
    association :user
    sequence(:value) { |n| "value #{n}" }
  end
end
