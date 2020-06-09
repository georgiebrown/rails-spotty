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
Story.destroy_all
Category.destroy_all


puts 'Creating Users'
user_set = []

puts "Creating Georgie"
georgie = User.create!(
  username: 'georgiebrown',
  first_name: 'Georgie',
  last_name: 'Brown',
  email: 'georgie@gmail.com',
  password: 'password',
  bio: '28 years old, Software developer'
  )
# file = URI.open("https://cdn.vox-cdn.com/thumbor/sK3gMTENF_LR1DhAUl9e3V_5jC4=/0x0:2592x2017/1200x800/filters:focal(1089x801:1503x1215)/cdn.vox-cdn.com/uploads/chorus_image/image/65282724/friendscast.0.0.1429818191.0.jpg")
# georgie.photo.attach(io: file, filename: "#{georgie.name}.jpg", content_type: 'image/jpg')

user_set << georgie
georgie.save!
puts "added georgie"


puts "Creating Rob"
rob = User.create!(
  first_name: 'Rob',
  last_name: 'Chapman',
  username: 'robchap',
  email: 'rob@gmail.com',
  password: 'password',
  bio: '28 years old, Software developer'
  )
# file = URI.open("https://cdn.vox-cdn.com/thumbor/sK3gMTENF_LR1DhAUl9e3V_5jC4=/0x0:2592x2017/1200x800/filters:focal(1089x801:1503x1215)/cdn.vox-cdn.com/uploads/chorus_image/image/65282724/friendscast.0.0.1429818191.0.jpg")
# rob.photo.attach(io: file, filename: "#{rob.name}.jpg", content_type: 'image/jpg')

user_set << rob
rob.save!
puts "added rob"


puts "Creating Keiichi"
keiichi = User.create!(
  first_name: 'Keiichi',
  last_name: 'Katsuno',
  username: 'KeiichiKatsuno',
  email: 'keiichi@gmail.com',
  password: 'password',
  bio: 'Loves coffee'
  )

# file = URI.open("https://cdn.vox-cdn.com/thumbor/sK3gMTENF_LR1DhAUl9e3V_5jC4=/0x0:2592x2017/1200x800/filters:focal(1089x801:1503x1215)/cdn.vox-cdn.com/uploads/chorus_image/image/65282724/friendscast.0.0.1429818191.0.jpg")
# keiichi.photo.attach(io: file, filename: "#{keiichi.name}.jpg", content_type: 'image/jpg')

user_set << keiichi
keiichi.save!
puts "added keiichi"

puts "Creating Nesil"
nesil = User.create!(
  first_name: 'Nesil',
  last_name: 'Ozer',
  username: 'nesilO',
  email: 'nesil@gmail.com',
  password: 'password',
  bio: 'Developer'
  )

# file = URI.open("https://cdn.vox-cdn.com/thumbor/sK3gMTENF_LR1DhAUl9e3V_5jC4=/0x0:2592x2017/1200x800/filters:focal(1089x801:1503x1215)/cdn.vox-cdn.com/uploads/chorus_image/image/65282724/friendscast.0.0.1429818191.0.jpg")
# nesil.photo.attach(io: file, filename: "#{nesil.name}.jpg", content_type: 'image/jpg')

user_set << nesil
nesil.save!

puts "added nesil"


puts "creating category"

pubCategory = Category.create!(name: "Pub", question: "What did you have to eat?")
hikeCategory = Category.create!(name: "Hike", question: "How far did you walk?")
restaurantCategory = Category.create!(name: "Restaurant", question: "What was the strangest thing your waiter said?")
shoppingCategory = Category.create!(name: "Shopping", question: "What did you buy")
campingCategory = Category.create!(name: "Camping", question: "What animals did you see")
outdoorCategory = Category.create!(name: "Outdoor Activity", question: "What was the best part?")
cafeCategory = Category.create!(name: "Cafe", question: "What was the strangest thing on the menu?")


puts "Creating spot 1"
spot1 = Spot.create!(name: "Sheepyard Flats", location: "Howqua River", category: campingCategory )
spot1Story1 = Story.create!(user: user_set.sample, content: "Camped at the hut on the Howqua river. Slept in our swags and went swimming in the river.", spot: spot1)

puts "Creating spot 2"

spot2 = Spot.create!(name: "Wilsons Prom Lighthouse", location: "Wilsons Prom", category: hikeCategory)
spot2Story2 = Story.create!(user: user_set.sample, content: "20km there and back. Saw a Koala and a kangaroo. Stayed the night in the lighthouse which was a real experience.  ", spot: spot2)


puts "Creating spot 3"

spot3 = Spot.create!(name: "RYDER", location: "Cremorne", category: shoppingCategory)
spot3Story3 = Story.create!(user: user_set.sample, content: "You have to go shopping here, great Australian label with awesome clothes. I bought a G'day jumper", spot: spot3)

puts "Creating spot 4"
spot4 = Spot.create!(name: "Marquis Of Lorne", location: "North Fitzroy", category: pubCategory)
spot4Story4 = Story.create!(user: user_set.sample, content: "Best pub in the North. Had my 25th birthday here. Had the chicken. I spent about $200 because it was my birthday. Yolo. It was sunny", spot: spot4)


# puts ""
# spots << Spot.create!(name: "Finns Beach Club", location: "Bali", category: "restaurant")
# spots << Spot.create!(name: "Casa Maria", location: "Tulum-Mexico", category: "seafood-restaurant")
# spots << Spot.create!(name: "Roof Mezza 360", location: "Istanbul", category: "restaurant")
# spots << Spot.create!(name: "Red Square", location: "Moskow", category: "Plaza")
# spots << Spot.create!(name: "Fairfield Park Boathouse & Tea Gardens", location: "Fairfield", category: "Outdoor Activity")
# spots << Spot.create!(name: "Marquis Of Lorne", location: "North Fitzroy", category: "Pub")
# spots << Spot.create!(name: "RYDER", location: "Cremorne", category: "Shopping")
# spots << Spot.create!(name: "Wilsons Prom Lighthouse", location: "Wilsons Prom", category: "Hike")
# spots << Spot.create!(name: "Sheepyard Flats", location: "Howqua River", category: "Camping" )

# puts "Creating stories"
# stories = []
# stories << Story.create!(user: user_set.sample, content: "Best pub in the North. Had my 25th birthday here. Had the chicken. I spent about $200 because it was my birthday. Yolo. It was sunny", spot: spots.sample)
# stories << Story.create!(user: user_set.sample, content: "You have to go shopping here, great Australian label with awesome clothes. I bought a G'day jumper", spot: spots.sample)
# stories << Story.create!(user: user_set.sample, content: "20km there and back. Saw a Koala and a kangaroo. Stayed the night in the lighthouse which was a real experience.  ", spot: spots.sample)
# stories << Story.create!(user: user_set.sample, content: "Camped at the hut on the Howqua river. Slept in our swags and went swimming in the river.", spot: spots.sample)
# stories << Story.create!(user: user_set.sample, content: "Camped at the hut on the Howqua river. Slept in our swags and went swimming in the river.", spot: spots.sample)


