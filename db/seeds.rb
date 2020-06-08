# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "cleaning database"
User.destroy_all
Spot.destroy_all


puts 'Creating Users'
user_set = []

user_set << User.create!(email: 'homer@aol.com', password: 'password')
user_set << User.create!(email: 'marge@aol.com', password: 'password')
user_set << User.create!(email: 'bart@aol.com', password: 'password')

puts "Creating spots"
spots = []
spots <<  Spot.create!(name: "Asian Beer Cafe", location: "Melbourne Central", category: "pub", place_id: "1")
spots << Spot.create!(name: "Finns Beach Club", location: "Bali", category: "restaurant", place_id: "2")
spots << Spot.create!(name: "Casa Maria", location: "Tulum-Mexico", category: "seafood-restaurant", place_id: "3")
spots << Spot.create!(name: "Roof Mezza 360", location: "Istanbul", category: "restaurant", place_id: "4")
spots << Spot.create!(name: "Red Square", location: "Moskow", category: "Plaza", place_id: "5")


