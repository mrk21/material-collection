# frozen_string_literal: true

FactoryBot.define do
  factory :asset do
    association :author, factory: :user
    association :project
    sequence(:title) { |i| "Asset #{i}" }
    sequence(:description) { |i| "Asset #{i} description" }
  end
end
