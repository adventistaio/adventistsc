# frozen_string_literal: true

# This will guess the User class
FactoryBot.define do
  factory :post do
    user { association :user }
    content { Faker::Lorem.sentence }
  end
end
