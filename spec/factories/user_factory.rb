# frozen_string_literal: true

# This will guess the User class
FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'Pa$$w0rd12345' }
    password_confirmation { 'Pa$$w0rd12345' }
  end
end
