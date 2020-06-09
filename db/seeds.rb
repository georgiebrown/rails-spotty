require 'open-uri'

puts "Cleaning database..."
Follow.destroy_all
Photo.destroy_all
User.destroy_all
Spot.destroy_all
Story.destroy_all
Category.destroy_all
puts "Clean!"

puts 'Creating Users...'
user_set = []

puts "Creating Georgie..."
photo1 = Photo.new
file = URI.open("https://picsum.photos/id/1025/500/500")
photo1.photo.attach(io: file, filename: "georgie.jpg", content_type: 'image/jpg')

georgie = User.create!(
  username: 'georgiebrown',
  first_name: 'Georgie',
  last_name: 'Brown',
  email: 'georgie@gmail.com',
  password: 'password',
  bio: '28 years old, Software developer'
  )
photo1.photoable = georgie
photo1.save!
user_set << georgie
puts "Added Georgie!"

puts "Creating Rob..."
photo2 = Photo.new
file = URI.open("https://picsum.photos/id/1025/500/500")
photo2.photo.attach(io: file, filename: "rob.jpg", content_type: 'image/jpg')

rob = User.create!(
  first_name: 'Rob',
  last_name: 'Chapman',
  username: 'robchap',
  email: 'rob@gmail.com',
  password: 'password',
  bio: '28 years old, Software developer'
  )
photo2.photoable = rob
photo2.save!
user_set << rob
puts "Added Rob!"

puts "Creating Keiichi..."
photo3 = Photo.new
file = URI.open("https://picsum.photos/id/1025/500/500")
photo3.photo.attach(io: file, filename: "keiichi.jpg", content_type: 'image/jpg')
keiichi = User.create!(
  first_name: 'Keiichi',
  last_name: 'Katsuno',
  username: 'KeiichiKatsuno',
  email: 'keiichi@gmail.com',
  password: 'password',
  bio: 'Loves coffee'
  )
photo3.photoable = keiichi
photo3.save!
user_set << keiichi
puts "Added Keiichi!"

puts "Creating Nesil..."
photo4 = Photo.new
file = URI.open("https://picsum.photos/id/1025/500/500")
photo4.photo.attach(io: file, filename: "nesil.jpg", content_type: 'image/jpg')
nesil = User.create!(
  first_name: 'Nesil',
  last_name: 'Ozer',
  username: 'nesilO',
  email: 'nesil@gmail.com',
  password: 'password',
  bio: 'Developer'
  )
photo4.photoable = nesil
photo4.save!
user_set << nesil
puts "Added Nesil!"

puts "Getting Users to follow each other..."
user_set.each do |follower|
  user_set.sample(rand(2..4)).each do |leader|
    Follow.create!(leader: leader, follower: follower) unless follower == leader
  end
end

puts "Creating Categories..."
pubCategory = Category.create!(name: "Pub", question: "What did you have to eat?")
hikeCategory = Category.create!(name: "Hike", question: "How far did you walk?")
restaurantCategory = Category.create!(name: "Restaurant", question: "What was the strangest thing your waiter said?")
shoppingCategory = Category.create!(name: "Shopping", question: "What did you buy")
campingCategory = Category.create!(name: "Camping", question: "What animals did you see")
outdoorCategory = Category.create!(name: "Outdoor Activity", question: "What was the best part?")
cafeCategory = Category.create!(name: "Cafe", question: "What was the strangest thing on the menu?")
puts "Added Categories!"

puts "Creating Spots..."
################################################################################
################################################################################
puts "Creating Spot 1..."
spot1 = Spot.create!(name: "Sheepyard Flats", location: "Howqua River", category: campingCategory)
puts "Adding Photos to Spot 1..."
spot1_photo1 = Photo.new
file = URI.open("https://picsum.photos/id/1043/1000")
spot1_photo1.photo.attach(io: file, filename: "spot1_photo1.jpg", content_type: 'image/jpg')
spot1_photo1.photoable = spot1
spot1_photo1.save!

spot1_photo2 = Photo.new
file = URI.open("https://picsum.photos/id/1044/1000")
spot1_photo2.photo.attach(io: file, filename: "spot1_photo2.jpg", content_type: 'image/jpg')
spot1_photo2.photoable = spot1
spot1_photo2.save!

spot1_photo3 = Photo.new
file = URI.open("https://picsum.photos/id/1045/1000")
spot1_photo3.photo.attach(io: file, filename: "spot1_photo3.jpg", content_type: 'image/jpg')
spot1_photo3.photoable = spot1
spot1_photo3.save!
############################################
puts "Adding Stories to Spot 1..."

spot1Story1 = Story.create!(user: user_set.sample, content: "Camped at the hut on the Howqua river. Slept in our swags and went swimming in the river.", spot: spot1)
spot1_story1_photo = Photo.new
file = URI.open("https://picsum.photos/id/1056/1000")
spot1_photo3.photo.attach(io: file, filename: "spot1_photo3.jpg", content_type: 'image/jpg')
spot1_photo3.photoable = spot1
spot1_photo3.save!

spot1Story2 = Story.create!(user: user_set.sample, content: "Camped at the hut on the Howqua river. Slept in our swags and went swimming in the river.", spot: spot1)
spot1_story2_photo = Photo.new
file = URI.open("https://picsum.photos/id/1047/1000")
spot1_photo3.photo.attach(io: file, filename: "spot1_photo3.jpg", content_type: 'image/jpg')
spot1_photo3.photoable = spot1
spot1_photo3.save!

spot1Story3 = Story.create!(user: user_set.sample, content: "Camped at the hut on the Howqua river. Slept in our swags and went swimming in the river.", spot: spot1)
spot1_story3_photo = Photo.new
file = URI.open("https://picsum.photos/id/1048/1000")
spot1_photo3.photo.attach(io: file, filename: "spot1_photo3.jpg", content_type: 'image/jpg')
spot1_photo3.photoable = spot1
spot1_photo3.save!

puts "Finished Spot 1!"
################################################################################
################################################################################
puts "Creating spot 2..."
spot2 = Spot.create!(name: "Wilsons Prom Lighthouse", location: "Wilsons Prom", category: hikeCategory)
puts "Adding Photos to Spot 2..."
spot2_photo1 = Photo.new
file = URI.open("https://picsum.photos/id/1055/1000")
spot2_photo1.photo.attach(io: file, filename: "spot2_photo1.jpg", content_type: 'image/jpg')
spot2_photo1.photoable = spot2
spot2_photo1.save!

spot2_photo2 = Photo.new
file = URI.open("https://picsum.photos/id/1047/1000")
spot2_photo2.photo.attach(io: file, filename: "spot2_photo2.jpg", content_type: 'image/jpg')
spot2_photo2.photoable = spot2
spot2_photo2.save!

spot2_photo3 = Photo.new
file = URI.open("https://picsum.photos/id/1048/1000")
spot2_photo3.photo.attach(io: file, filename: "spot2_photo3.jpg", content_type: 'image/jpg')
spot2_photo3.photoable = spot2
spot2_photo3.save!
############################################
puts "Adding Stories to Spot 2..."

spot2Story1 = Story.create!(user: user_set.sample, content: "20km there and back. Saw a Koala and a kangaroo. Stayed the night in the lighthouse which was a real experience.  ", spot: spot2)
spot2Story2 = Story.create!(user: user_set.sample, content: "20km there and back. Saw a Koala and a kangaroo. Stayed the night in the lighthouse which was a real experience.  ", spot: spot2)
spot2Story3 = Story.create!(user: user_set.sample, content: "20km there and back. Saw a Koala and a kangaroo. Stayed the night in the lighthouse which was a real experience.  ", spot: spot2)

puts "Finished Spot 2!"
################################################################################
################################################################################
puts "Creating spot 3..."
spot3 = Spot.create!(name: "RYDER", location: "Cremorne", category: shoppingCategory)
puts "Adding Photos to Spot 3..."
spot3_photo1 = Photo.new
file = URI.open("https://picsum.photos/id/1049/1000")
spot3_photo1.photo.attach(io: file, filename: "spot3_photo1.jpg", content_type: 'image/jpg')
spot3_photo1.photoable = spot3
spot3_photo1.save!

spot3_photo2 = Photo.new
file = URI.open("https://picsum.photos/id/1050/1000")
spot3_photo2.photo.attach(io: file, filename: "spot3_photo2.jpg", content_type: 'image/jpg')
spot3_photo2.photoable = spot3
spot3_photo2.save!

spot3_photo3 = Photo.new
file = URI.open("https://picsum.photos/id/1051/1000")
spot3_photo3.photo.attach(io: file, filename: "spot3_photo3.jpg", content_type: 'image/jpg')
spot3_photo3.photoable = spot3
spot3_photo3.save!
############################################
puts "Adding Stories to Spot 3..."

spot3Story1 = Story.create!(user: user_set.sample, content: "You have to go shopping here, great Australian label with awesome clothes. I bought a G'day jumper", spot: spot3)
spot3Story2 = Story.create!(user: user_set.sample, content: "You have to go shopping here, great Australian label with awesome clothes. I bought a G'day jumper", spot: spot3)
spot3Story3 = Story.create!(user: user_set.sample, content: "You have to go shopping here, great Australian label with awesome clothes. I bought a G'day jumper", spot: spot3)

puts "Finished Spot 3!"
################################################################################
################################################################################
puts "Creating spot 4..."
spot4 = Spot.create!(name: "Marquis Of Lorne", location: "North Fitzroy", category: pubCategory)
puts "Adding Photos to Spot 4..."
spot4_photo1 = Photo.new
file = URI.open("https://picsum.photos/id/1052/1000")
spot4_photo1.photo.attach(io: file, filename: "spot4_photo1.jpg", content_type: 'image/jpg')
spot4_photo1.photoable = spot4
spot4_photo1.save!

spot4_photo2 = Photo.new
file = URI.open("https://picsum.photos/id/1053/1000")
spot4_photo2.photo.attach(io: file, filename: "spot4_photo2.jpg", content_type: 'image/jpg')
spot4_photo2.photoable = spot4
spot4_photo2.save!

spot4_photo3 = Photo.new
file = URI.open("https://picsum.photos/id/1054/1000")
spot4_photo3.photo.attach(io: file, filename: "spot4_photo3.jpg", content_type: 'image/jpg')
spot4_photo3.photoable = spot4
spot4_photo3.save!
############################################
puts "Adding Stories to Spot 4..."

spot4Story1 = Story.create!(user: user_set.sample, content: "Best pub in the North. Had my 25th birthday here. Had the chicken. I spent about $200 because it was my birthday. Yolo. It was sunny", spot: spot4)
spot4Story2 = Story.create!(user: user_set.sample, content: "Great pub, not welcome after my friends 25th though.", spot: spot4)
spot4Story3 = Story.create!(user: user_set.sample, content: "Love this place, used to work here when I was in uni. Owners are lovely", spot: spot4)

puts "Finished Spot 4!"
################################################################################
################################################################################

puts "Adding some favourites"






















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


