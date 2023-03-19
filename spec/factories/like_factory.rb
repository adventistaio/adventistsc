# frozen_string_literal: true

# This will guess the User class
FactoryBot.define do
  factory :like do
    user { association :user }

    for_post

    trait :for_post do
      association :reactable, factory: :post
    end
  end
end
