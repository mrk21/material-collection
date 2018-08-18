FactoryBot.define do
  factory :project do
    association :owner, factory: :user
    sequence(:title) { |i| "Project #{i}" }
    sequence(:description) { |i| "Project #{i} description" }
  end
end
