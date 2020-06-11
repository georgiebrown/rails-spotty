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
photo1.file.attach(io: file, filename: "georgie.jpg", content_type: 'image/jpg')

georgie = User.create!(
  username: 'georgiebrown',
  first_name: 'Georgie',
  last_name: 'Brown',
  email: 'georgie@gmail.com',
  password: 'password',
  bio: 'Vino quarantino'
  )

photo1.photoable = georgie
photo1.save!

user_set << georgie
puts "Added Georgie!"

puts "Creating Rob..."
photo2 = Photo.new
file = URI.open("https://picsum.photos/id/1025/500/500")
photo2.file.attach(io: file, filename: "rob.jpg", content_type: 'image/jpg')

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
photo3.file.attach(io: file, filename: "keiichi.jpg", content_type: 'image/jpg')
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
photo4.file.attach(io: file, filename: "nesil.jpg", content_type: 'image/jpg')
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
pubCategory = Category.create!(name: "Pub", question: "What did you have to eat?", icon: "https://cdn.mapmarker.io/api/v1/pin?size=60&background=%23FCC400&icon=fa-star&color=%23FFFFFF&voffset=1&hoffset=1&")
hikeCategory = Category.create!(name: "Hike", question: "How far did you walk?", icon: "https://cdn.mapmarker.io/api/v1/pin?size=60&background=%23194D33&icon=fa-star&color=%23FFFFFF&voffset=1&hoffset=1&")
restaurantCategory = Category.create!(name: "Restaurant", question: "What was the strangest thing your waiter said?", icon: "https://cdn.mapmarker.io/api/v1/pin?size=60&background=%23FCC400&icon=fa-star&color=%23FFFFFF&voffset=1&hoffset=1&")
shoppingCategory = Category.create!(name: "Shopping", question: "What did you buy", icon: "https://cdn.mapmarker.io/api/v1/pin?size=60&background=%2373D8FF&icon=fa-star&color=%23FFFFFF&voffset=1&hoffset=1&")
campingCategory = Category.create!(name: "Camping", question: "What animals did you see", icon: "https://cdn.mapmarker.io/api/v1/pin?size=60&background=%23194D33&icon=fa-star&color=%23FFFFFF&voffset=1&hoffset=1&")
outdoorCategory = Category.create!(name: "Outdoor Activity", question: "What was the best part?", icon: "https://cdn.mapmarker.io/api/v1/pin?size=60&background=%230062B1&icon=fa-star&color=%23FFFFFF&voffset=1&hoffset=1&")
cafeCategory = Category.create!(name: "Cafe", question: "What was the strangest thing on the menu?", icon: "https://cdn.mapmarker.io/api/v1/pin?size=60&background=%23FCC400&icon=fa-star&color=%23FFFFFF&voffset=1&hoffset=1&")
puts "Added Categories!"

puts "Creating Spots..."
spot_set = []
################################################################################
################################################################################
puts "Creating Spot 1..."
spot1 = Spot.new(name: "Sheepyard Flats", location: "Howqua River", category: campingCategory)
spot_set << spot1

puts "Adding Photos to Spot 1..."
spot1_photo1 = Photo.new
file = URI.open("https://picsum.photos/id/1043/1000")
spot1_photo1.file.attach(io: file, filename: "spot1_photo1.jpg", content_type: 'image/jpg')

spot1_photo2 = Photo.new
file = URI.open("https://picsum.photos/id/1044/1000")
spot1_photo2.file.attach(io: file, filename: "spot1_photo2.jpg", content_type: 'image/jpg')

spot1_photo3 = Photo.new
file = URI.open("https://picsum.photos/id/1045/1000")
spot1_photo3.file.attach(io: file, filename: "spot1_photo3.jpg", content_type: 'image/jpg')
spot1.photos = [spot1_photo1, spot1_photo2, spot1_photo3]
spot1.save!

############################################
puts "Adding Stories to Spot 1..."

spot1Story1 = Story.new(user: user_set.sample, content: "Camped at the hut on the Howqua river. Slept in our swags and went swimming in the river.", spot: spot1)
spot1_story1_photo = Photo.new
file = URI.open("https://picsum.photos/id/1056/1000")
spot1_story1_photo.file.attach(io: file, filename: "spot1_story1_photo.jpg", content_type: 'image/jpg')
spot1_story1_photo.photoable = spot1Story1
spot1_story1_photo.save!

spot1Story2 = Story.new(user: user_set.sample, content: "Camped at the hut on the Howqua river. Slept in our swags and went swimming in the river.", spot: spot1)
spot1_story2_photo = Photo.new
file = URI.open("https://picsum.photos/id/1057/1000")
spot1_story2_photo.file.attach(io: file, filename: "spot1_story2_photo.jpg", content_type: 'image/jpg')
spot1_story2_photo.photoable = spot1Story2
spot1_story2_photo.save!

spot1Story3 = Story.new(user: user_set.sample, content: "Camped at the hut on the Howqua river. Slept in our swags and went swimming in the river.", spot: spot1)
spot1_story3_photo = Photo.new
file = URI.open("https://picsum.photos/id/1058/1000")
spot1_story3_photo.file.attach(io: file, filename: "spot1_story3_photo.jpg", content_type: 'image/jpg')
spot1_story3_photo.photoable = spot1Story3
spot1_story3_photo.save!

puts "Finished Spot 1!"
################################################################################
################################################################################
puts "Creating spot 2..."
spot2 = Spot.new(name: "Wilsons Prom Lighthouse", location: "Wilsons Prom", category: hikeCategory)
spot_set << spot2
puts "Adding Photos to Spot 2..."
spot2_photo1 = Photo.new
file = URI.open("https://picsum.photos/id/1055/1000")
spot2_photo1.file.attach(io: file, filename: "spot2_photo1.jpg", content_type: 'image/jpg')

spot2_photo2 = Photo.new
file = URI.open("https://picsum.photos/id/1047/1000")
spot2_photo2.file.attach(io: file, filename: "spot2_photo2.jpg", content_type: 'image/jpg')

spot2_photo3 = Photo.new
file = URI.open("https://picsum.photos/id/1048/1000")
spot2_photo3.file.attach(io: file, filename: "spot2_photo3.jpg", content_type: 'image/jpg')
spot2.photos = [spot2_photo1, spot2_photo2, spot2_photo3]
spot2.save!

############################################
puts "Adding Stories to Spot 2..."

spot2Story1 = Story.new(user: user_set.sample, content: "20km there and back. Saw a Koala and a kangaroo. Stayed the night in the lighthouse which was a real experience.  ", spot: spot2)
spot2_story1_photo = Photo.new
file = URI.open("https://picsum.photos/id/1059/1000")
spot2_story1_photo.file.attach(io: file, filename: "spot2_story1_photo.jpg", content_type: 'image/jpg')
spot2_story1_photo.photoable = spot2Story1
spot2_story1_photo.save!

spot2Story2 = Story.new(user: user_set.sample, content: "20km there and back. Saw a Koala and a kangaroo. Stayed the night in the lighthouse which was a real experience.  ", spot: spot2)
spot2_story2_photo = Photo.new
file = URI.open("https://picsum.photos/id/1060/1000")
spot2_story2_photo.file.attach(io: file, filename: "spot2_story2_photo.jpg", content_type: 'image/jpg')
spot2_story2_photo.photoable = spot2Story2
spot2_story2_photo.save!

spot2Story3 = Story.new(user: user_set.sample, content: "20km there and back. Saw a Koala and a kangaroo. Stayed the night in the lighthouse which was a real experience.  ", spot: spot2)
spot2_story3_photo = Photo.new
file = URI.open("https://picsum.photos/id/1061/1000")
spot2_story3_photo.file.attach(io: file, filename: "spot2_story3_photo.jpg", content_type: 'image/jpg')
spot2_story3_photo.photoable = spot2Story3
spot2_story3_photo.save!

puts "Finished Spot 2!"
################################################################################
################################################################################
puts "Creating spot 3..."
spot3 = Spot.new(name: "RYDER", location: "126 Cubitt St, Cremorne", category: shoppingCategory)
spot_set << spot3
puts "Adding Photos to Spot 3..."
spot3_photo1 = Photo.new
file = URI.open("https://picsum.photos/id/1049/1000")
spot3_photo1.file.attach(io: file, filename: "spot3_photo1.jpg", content_type: 'image/jpg')

spot3_photo2 = Photo.new
file = URI.open("https://picsum.photos/id/1050/1000")
spot3_photo2.file.attach(io: file, filename: "spot3_photo2.jpg", content_type: 'image/jpg')

spot3_photo3 = Photo.new
file = URI.open("https://picsum.photos/id/1051/1000")
spot3_photo3.file.attach(io: file, filename: "spot3_photo3.jpg", content_type: 'image/jpg')
spot3.photos = [spot3_photo1, spot3_photo2, spot3_photo3]
spot3.save!

############################################
puts "Adding Stories to Spot 3..."

spot3Story1 = Story.new(user: user_set.sample, content: "You have to go shopping here, great Australian label with awesome clothes. I bought a G'day jumper", spot: spot3)
spot3_story1_photo = Photo.new
file = URI.open("https://picsum.photos/id/1062/1000")
spot3_story1_photo.file.attach(io: file, filename: "spot3_story1_photo.jpg", content_type: 'image/jpg')
spot3_story1_photo.photoable = spot3Story1
spot3_story1_photo.save!

spot3Story2 = Story.new(user: user_set.sample, content: "You have to go shopping here, great Australian label with awesome clothes. I bought a G'day jumper", spot: spot3)
spot3_story2_photo = Photo.new
file = URI.open("https://picsum.photos/id/1063/1000")
spot3_story2_photo.file.attach(io: file, filename: "spot3_story2_photo.jpg", content_type: 'image/jpg')
spot3_story2_photo.photoable = spot3Story2
spot3_story2_photo.save!

spot3Story3 = Story.new(user: user_set.sample, content: "You have to go shopping here, great Australian label with awesome clothes. I bought a G'day jumper", spot: spot3)
spot3_story3_photo = Photo.new
file = URI.open("https://picsum.photos/id/1064/1000")
spot3_story3_photo.file.attach(io: file, filename: "spot3_story3_photo.jpg", content_type: 'image/jpg')
spot3_story3_photo.photoable = spot3Story3
spot3_story3_photo.save!

puts "Finished Spot 3!"
################################################################################
################################################################################
puts "Creating spot 4..."
spot4 = Spot.new(name: "Marquis Of Lorne", location: "North Fitzroy", category: pubCategory)
spot_set << spot4
puts "Adding Photos to Spot 4..."
spot4_photo1 = Photo.new
file = URI.open("https://picsum.photos/id/1052/1000")
spot4_photo1.file.attach(io: file, filename: "spot4_photo1.jpg", content_type: 'image/jpg')

spot4_photo2 = Photo.new
file = URI.open("https://picsum.photos/id/1053/1000")
spot4_photo2.file.attach(io: file, filename: "spot4_photo2.jpg", content_type: 'image/jpg')

spot4_photo3 = Photo.new
file = URI.open("https://picsum.photos/id/1054/1000")
spot4_photo3.file.attach(io: file, filename: "spot4_photo3.jpg", content_type: 'image/jpg')
spot4.photos = [spot4_photo1, spot4_photo2, spot4_photo3]
spot4.save!

############################################
puts "Adding Stories to Spot 4..."

spot4Story1 = Story.new(user: user_set.sample, content: "Best pub in the North. Had my 25th birthday here. Had the chicken. I spent about $200 because it was my birthday. Yolo. It was sunny", spot: spot4)
spot4_story1_photo = Photo.new
file = URI.open("https://picsum.photos/id/1065/1000")
spot4_story1_photo.file.attach(io: file, filename: "spot4_story1_photo.jpg", content_type: 'image/jpg')
spot4_story1_photo.photoable = spot4Story1
spot4_story1_photo.save!

spot4Story2 = Story.new(user: user_set.sample, content: "Great pub, not welcome after my friends 25th though.", spot: spot4)
spot4_story2_photo = Photo.new
file = URI.open("https://picsum.photos/id/1066/1000")
spot4_story2_photo.file.attach(io: file, filename: "spot4_story2_photo.jpg", content_type: 'image/jpg')
spot4_story2_photo.photoable = spot4Story2
spot4_story2_photo.save!

spot4Story3 = Story.new(user: user_set.sample, content: "Love this place, used to work here when I was in uni. Owners are lovely", spot: spot4)
spot4_story3_photo = Photo.new
file = URI.open("https://picsum.photos/id/1067/1000")
spot4_story3_photo.file.attach(io: file, filename: "spot4_story3_photo.jpg", content_type: 'image/jpg')
spot4_story3_photo.photoable = spot4Story3
spot4_story3_photo.save!

puts "Finished Spot 4!"
puts "Adding some favourites"


user_set.each do |user|
  spot_set.sample(rand(2..4)).each do |spot|
    Favourite.create!(user: user, spot: spot)
  end
end
