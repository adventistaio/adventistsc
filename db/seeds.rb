# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

USERS_NUMBER = 10
POST_MAX = 10

# USERS
puts 'Removing users an their data from database'
User.destroy_all

USERS_NUMBER.times.each do |_|
  user = User.new(email: Faker::Internet.email, password: 'Secret.XYZ123', password_confirmation: 'Secret.XYZ123')

  rand(POST_MAX).times.each do |_|
    user.posts.build(content: Faker::Lorem.paragraph)
  end

  user.save!
end

puts "#{USERS_NUMBER} Users with random posts were created."
