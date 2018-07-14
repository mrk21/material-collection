FactoryBot.define do
  factory :hoge do
    association :user
    value { 'value' }
  end
end
