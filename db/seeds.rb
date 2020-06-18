require 'open-uri'

puts "Cleaning database..."
Follow.destroy_all
Photo.destroy_all
User.destroy_all
Spot.destroy_all
Story.destroy_all
Question.destroy_all
Category.destroy_all
puts "Clean!"

puts 'Creating Users...'
user_set = []

puts "Creating Georgie..."
photo1 = Photo.new
file = URI.open("https://ca.slack-edge.com/T02NE0241-U011Q1E8R8D-e74a2399c9e4-512")
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
file = URI.open("https://ca.slack-edge.com/T02NE0241-U011WCU5ZM2-0124e0d0c487-512")
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
file = URI.open("https://ca.slack-edge.com/T02NE0241-U011KKXUF7Y-4da372d713d8-512")
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
file = URI.open("https://ca.slack-edge.com/T02NE0241-U011Q4YNSMB-dfffafd224b7-512")
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
pubCategory = Category.create!(name: "Pub")
hikeCategory = Category.create!(name: "Hike")
restaurantCategory = Category.create!(name: "Restaurant")
shoppingCategory = Category.create!(name: "Shopping")
campingCategory = Category.create!(name: "Camping")
outdoorCategory = Category.create!(name: "Outdoor Activity")
cafeCategory = Category.create!(name: "Cafe")
otherCategory = Category.create!(name: "Other")

puts "Added Categories!"
pub_questions = []

puts "Creating pub question 1..."
pubQuestion1 = Question.new(content: "Who did you go with?", category: pubCategory)
pub_questions << pubQuestion1
pubQuestion1.save!

puts "Creating pub question 2..."
pubQuestion2 = Question.new(content: "What did you eat?", category: pubCategory)
pub_questions << pubQuestion2
pubQuestion2.save!

puts "Creating pub question 3..."
pubQuestion3 = Question.new(content: "Best/Worst or wierdest thing that happened?", category: pubCategory)
pub_questions << pubQuestion3
pubQuestion3.save!

################################################################################
################################################################################

hike_questions = []
puts "Creating hike question 1..."
hikeQuestion1 = Question.new(content: "What did you do?", category: hikeCategory)
hike_questions << hikeQuestion1
hikeQuestion1.save!

puts "Creating hike question 2..."
hikeQuestion2 = Question.new(content: "How far did you walk?", category: hikeCategory)
hike_questions << hikeQuestion2
hikeQuestion2.save!

puts "Creating hike question 3..."
hikeQuestion3 = Question.new(content: "What animals did you see?", category: hikeCategory)
hike_questions << hikeQuestion3
hikeQuestion3.save!

################################################################################
################################################################################

restaurant_questions = []

puts "Creating restaurant question 1..."
restaurantQuestion1 = Question.new(content: "Who did you go with?", category: restaurantCategory)
restaurant_questions << restaurantQuestion1
restaurantQuestion1.save!

puts "Creating restaurant question 2..."
restaurantQuestion2 = Question.new(content: "What did you eat?", category: restaurantCategory)
restaurant_questions << restaurantQuestion2
restaurantQuestion2.save!

puts "Creating restaurant question 3..."
restaurantQuestion3 = Question.new(content: "Best/Worst or wierdest thing that happened?", category: restaurantCategory)
restaurant_questions << restaurantQuestion3
restaurantQuestion3.save!

################################################################################
################################################################################

shopping_questions = []

puts "Creating restaurant question 1..."
shoppingQuestion1 = Question.new(content: "What did you buy?", category: shoppingCategory)
shopping_questions << shoppingQuestion1
shoppingQuestion1.save!

puts "Creating restaurant question 2..."
shoppingQuestion2 = Question.new(content: "What was the occasion", category: shoppingCategory)
shopping_questions << shoppingQuestion2
shoppingQuestion2.save!

################################################################################
################################################################################

camping_questions = []
puts "Creating camping question 1..."
campingQuestion1 = Question.new(content: "What did you do?", category: campingCategory)
camping_questions << campingQuestion1
campingQuestion1.save!

puts "Creating camping question 2..."
campingQuestion2 = Question.new(content: "Where did you sleep?", category: campingCategory)
camping_questions << campingQuestion2
campingQuestion2.save!


puts "Creating camping question 3..."
campingQuestion3 = Question.new(content: "What did you do?", category: campingCategory)
camping_questions << campingQuestion3
campingQuestion3.save!

################################################################################
################################################################################

outdoor_questions = []

puts "Creating outdoor question 1..."
outdoorQuestion1 = Question.new(content: "What did you do?", category: outdoorCategory)
outdoor_questions << outdoorQuestion1
outdoorQuestion1.save!

outdoorQuestion2 = Question.new(content: "What was the best thing you did?", category: outdoorCategory)
outdoor_questions << outdoorQuestion2
outdoorQuestion2.save!

outdoorQuestion3 = Question.new(content: "Any hot tips?", category: outdoorCategory)
outdoor_questions << outdoorQuestion3
outdoorQuestion3.save!

################################################################################
################################################################################

cafe_questions = []

puts "Creating cafe question 1..."
cafeQuestion1 = Question.new(content: "How do you take your coffee?", category: cafeCategory)
cafe_questions << cafeQuestion1
cafeQuestion1.save!

cafeQuestion3 = Question.new(content: "Did you rate the barrista?", category: cafeCategory)
cafe_questions << cafeQuestion3
cafeQuestion3.save!


puts "Creating Spots..."
spot_set = []
################################################################################
################################################################################
puts "Creating Spot 1..."
spot1 = Spot.new(name: "Sheepyard Flats", location: "Howqua River", category: campingCategory)
spot_set << spot1

puts "Adding Photos to Spot 1..."
spot1_photo1 = Photo.new
file = URI.open("https://res.cloudinary.com/daqhmzr2j/image/upload/v1592265682/Howqua-River-Walk-RC.1600x900-1100x619_zzj3zg.jpg")
spot1_photo1.file.attach(io: file, filename: "spot1_photo1.jpg", content_type: 'image/jpg')


spot1_photo2 = Photo.new
file = URI.open("https://res.cloudinary.com/daqhmzr2j/image/upload/v1592265682/51890742_zumoky.jpg")
spot1_photo2.file.attach(io: file, filename: "spot1_photo2.jpg", content_type: 'image/jpg')

spot1_photo3 = Photo.new
file = URI.open("https://res.cloudinary.com/daqhmzr2j/image/upload/v1592265682/Howqua-River-Walk-RC.1600x900-1100x619_zzj3zg.jpg")
spot1_photo3.file.attach(io: file, filename: "spot1_photo3.jpg", content_type: 'image/jpg')
spot1.photos = [spot1_photo1, spot1_photo2, spot1_photo3]
spot1.save!

############################################
puts "Adding Stories to Spot 1..."

spot1Story1 = Story.new(question: hikeQuestion1, user: user_set.sample, content: "We stayed in a hut on the Howqua river. We slept in our swags outside under the stars and went swimming in the river.", spot: spot1)
spot1_story1_photo = Photo.new
file = URI.open("https://res.cloudinary.com/daqhmzr2j/image/upload/v1592265682/Howqua-River-Walk-RC.1600x900-1100x619_zzj3zg.jpg")
spot1_story1_photo.file.attach(io: file, filename: "spot1_story1_photo.jpg", content_type: 'image/jpg')
spot1_story1_photo.photoable = spot1Story1
spot1_story1_photo.save!
spot1Story1.save!

spot1Story2 = Story.new(question: hikeQuestion1, user: user_set.sample, content: "This place is amazing. We camped in our new tents, and made a huge bondire. We saw so many kangaroos!", spot: spot1)
spot1_story2_photo = Photo.new
file = URI.open("https://res.cloudinary.com/daqhmzr2j/image/upload/v1592265682/Howqua-River-Walk-RC.1600x900-1100x619_zzj3zg.jpg")
spot1_story2_photo.file.attach(io: file, filename: "spot1_story2_photo.jpg", content_type: 'image/jpg')
spot1_story2_photo.photoable = spot1Story2
spot1_story2_photo.save!
spot1Story2.save!

spot1Story3 = Story.new(question: hikeQuestion1, user: user_set.sample, content: "So many great hikes around. We made a big fire at night and cooked our dinner on it", spot: spot1)
spot1_story3_photo = Photo.new
file = URI.open("https://res.cloudinary.com/daqhmzr2j/image/upload/v1592265682/Howqua-River-Walk-RC.1600x900-1100x619_zzj3zg.jpg")
spot1_story3_photo.file.attach(io: file, filename: "spot1_story3_photo.jpg", content_type: 'image/jpg')
spot1_story3_photo.photoable = spot1Story3
spot1_story3_photo.save!
spot1Story3.save!

puts "Finished Spot 1!"
################################################################################
################################################################################
puts "Creating spot 2..."
spot2 = Spot.new(name: "Wilsons Prom Lighthouse", location: "Wilsons Prom", category: hikeCategory)
spot_set << spot2
puts "Adding Photos to Spot 2..."
spot2_photo1 = Photo.new
file = URI.open("https://res.cloudinary.com/daqhmzr2j/image/upload/v1592207623/wilsonsprom_p1g2tx.jpg")
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

spot2Story1 = Story.new(question: campingQuestion2, user: user_set.sample, content: "20km there and back. Saw a Koala and a kangaroo. Stayed the night in the lighthouse which was a real experience.  ", spot: spot2)
spot2_story1_photo = Photo.new
file = URI.open("https://res.cloudinary.com/daqhmzr2j/image/upload/v1592207623/wilsonsprom_p1g2tx.jpg")
spot2_story1_photo.file.attach(io: file, filename: "spot2_story1_photo.jpg", content_type: 'image/jpg')
spot2_story1_photo.photoable = spot2Story1
spot2_story1_photo.save!
spot2Story1.save!

spot2Story2 = Story.new(question: campingQuestion1,user: user_set.sample, content: "Make sure you pack a spare pair of socks!", spot: spot2)
spot2_story2_photo = Photo.new
file = URI.open("https://res.cloudinary.com/daqhmzr2j/image/upload/v1592207719/466c9021b812de931ff99d7e8cf9f7fc_2048X1152_icundo.jpg")
spot2_story2_photo.file.attach(io: file, filename: "spot2_story2_photo.jpg", content_type: 'image/jpg')
spot2_story2_photo.photoable = spot2Story2
spot2_story2_photo.save!
spot2Story2.save!

spot2Story3 = Story.new(question: campingQuestion3,user: user_set.sample, content: "That was so hard but worth it. So many great swimming spots along the way ", spot: spot2)
spot2_story3_photo = Photo.new
file = URI.open("https://res.cloudinary.com/daqhmzr2j/image/upload/v1592207720/GettyImages-160518799-800x584_xudtsm.jpg")
spot2_story3_photo.file.attach(io: file, filename: "spot2_story3_photo.jpg", content_type: 'image/jpg')
spot2_story3_photo.photoable = spot2Story3
spot2_story3_photo.save!
spot2Story3.save!

puts "Finished Spot 2!"
################################################################################
################################################################################
puts "Creating spot 3..."
spot3 = Spot.new(name: "RYDER", location: "126 Cubitt St, Cremorne", category: shoppingCategory)
spot_set << spot3
puts "Adding Photos to Spot 3..."
spot3_photo1 = Photo.new
file = URI.open("https://res.cloudinary.com/daqhmzr2j/image/upload/v1592207851/c4197b60b1396f6054a0d5f1e88653c5_cuzvov.jpg")
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

spot3Story1 = Story.new(question: shoppingQuestion1,user: user_set.sample, content: "You have to go shopping here, great Australian label with awesome clothes. I bought a G'day jumper", spot: spot3)
spot3_story1_photo = Photo.new
file = URI.open("https://res.cloudinary.com/daqhmzr2j/image/upload/v1592207851/c4197b60b1396f6054a0d5f1e88653c5_cuzvov.jpg")
spot3_story1_photo.file.attach(io: file, filename: "spot3_story1_photo.jpg", content_type: 'image/jpg')
spot3_story1_photo.photoable = spot3Story1
spot3_story1_photo.save!
spot3Story1.save!

puts "Finished Spot 3!"
################################################################################
################################################################################
puts "Creating spot 4..."
spot4 = Spot.new(name: "Marquis Of Lorne", location: "North Fitzroy", category: pubCategory)
spot_set << spot4
puts "Adding Photos to Spot 4..."
spot4_photo1 = Photo.new
file = URI.open("https://res.cloudinary.com/daqhmzr2j/image/upload/v1592179979/694ebbd76a01a7b3c5171e87f33d0205_ujovwg.jpg")
spot4_photo1.file.attach(io: file, filename: "spot4_photo1.jpg", content_type: 'image/jpg')

spot4_photo2 = Photo.new
file = URI.open("https://res.cloudinary.com/daqhmzr2j/image/upload/v1592179979/694ebbd76a01a7b3c5171e87f33d0205_ujovwg.jpg")
spot4_photo2.file.attach(io: file, filename: "spot4_photo2.jpg", content_type: 'image/jpg')

spot4_photo3 = Photo.new
file = URI.open("https://res.cloudinary.com/daqhmzr2j/image/upload/v1592179979/694ebbd76a01a7b3c5171e87f33d0205_ujovwg.jpg")
spot4_photo3.file.attach(io: file, filename: "spot4_photo3.jpg", content_type: 'image/jpg')
spot4.photos = [spot4_photo1, spot4_photo2, spot4_photo3]
spot4.save!

############################################
puts "Adding Stories to Spot 4..."

spot4Story1 = Story.new(question: pubQuestion1, user: user_set.sample, content: "Best pub in the North. Had my 25th birthday here. Had the chicken. I spent about $200 because it was my birthday. Yolo. It was sunny", spot: spot4)
spot4_story1_photo = Photo.new
file = URI.open("https://res.cloudinary.com/daqhmzr2j/image/upload/v1592179979/694ebbd76a01a7b3c5171e87f33d0205_ujovwg.jpg")
spot4_story1_photo.file.attach(io: file, filename: "spot4_story1_photo.jpg", content_type: 'image/jpg')
spot4_story1_photo.photoable = spot4Story1
spot4_story1_photo.save!
spot4Story1.save!

spot4Story2 = Story.new(question: pubQuestion1, user: user_set.sample, content: "Great pub, not welcome after my friends 25th though.", spot: spot4)
spot4_story2_photo = Photo.new
file = URI.open("https://res.cloudinary.com/daqhmzr2j/image/upload/v1592179979/694ebbd76a01a7b3c5171e87f33d0205_ujovwg.jpg")
spot4_story2_photo.file.attach(io: file, filename: "spot4_story2_photo.jpg", content_type: 'image/jpg')
spot4_story2_photo.photoable = spot4Story2
spot4_story2_photo.save!
spot4Story2.save!

spot4Story3 = Story.new(question: pubQuestion1, user: user_set.sample, content: "Love this place, used to work here when I was in uni. Owners are lovely", spot: spot4)
spot4_story3_photo = Photo.new
file = URI.open("https://res.cloudinary.com/daqhmzr2j/image/upload/v1592179979/694ebbd76a01a7b3c5171e87f33d0205_ujovwg.jpg")
spot4_story3_photo.file.attach(io: file, filename: "spot4_story3_photo.jpg", content_type: 'image/jpg')
spot4_story3_photo.photoable = spot4Story3
spot4_story3_photo.save!
spot4Story3.save!

puts "Finished Spot 4!"
puts "Adding some favourites"

################################################################################
################################################################################
puts "Creating spot 5..."
spot5 = Spot.new(name: "Tipo", location: "Melbourne", category: restaurantCategory)
spot_set << spot5
puts "Adding Photos to Spot 5..."
spot5_photo1 = Photo.new
file = URI.open("https://res.cloudinary.com/daqhmzr2j/image/upload/v1592185100/384c17e06290418805406ff40142422a_z5rqjv.jpg")
spot5_photo1.file.attach(io: file, filename: "spot5_photo1.jpg", content_type: 'image/jpg')

spot5_photo2 = Photo.new
file = URI.open("https://res.cloudinary.com/daqhmzr2j/image/upload/v1592185100/d8c2eca0a9d251713ed3aedb410628f3_xh7q1n.jpg")
spot5_photo2.file.attach(io: file, filename: "spot5_photo2.jpg", content_type: 'image/jpg')

spot5_photo3 = Photo.new
file = URI.open("https://res.cloudinary.com/daqhmzr2j/image/upload/v1592185100/d8c2eca0a9d251713ed3aedb410628f3_xh7q1n.jpg")
spot5_photo3.file.attach(io: file, filename: "spot5_photo3.jpg", content_type: 'image/jpg')
spot5.photos = [spot5_photo1, spot5_photo2, spot5_photo3]
spot5.save!

############################################
puts "Adding Stories to Spot 5..."

spot5Story1 = Story.new(question: restaurantQuestion1, user: user_set.sample, content: "I went here with Bella for our birthdays. Best pasta in Melbourne. $$$", spot: spot5)
spot5_story1_photo = Photo.new
file = URI.open("https://res.cloudinary.com/daqhmzr2j/image/upload/v1592185100/d8c2eca0a9d251713ed3aedb410628f3_xh7q1n.jpg")
spot5_story1_photo.file.attach(io: file, filename: "spot5_story1_photo.jpg", content_type: 'image/jpg')
spot5_story1_photo.photoable = spot5Story1
spot5_story1_photo.save!
spot5Story1.save!

spot5Story2 = Story.new(question: restaurantQuestion1, user: user_set.sample, content: "Pasta brings me so much happiness", spot: spot5)
spot5_story2_photo = Photo.new
file = URI.open("https://res.cloudinary.com/daqhmzr2j/image/upload/v1592185100/d8c2eca0a9d251713ed3aedb410628f3_xh7q1n.jpg")
spot5_story2_photo.file.attach(io: file, filename: "spot5_story2_photo.jpg", content_type: 'image/jpg')
spot5_story2_photo.photoable = spot5Story2
spot5_story2_photo.save!
spot5Story2.save!

spot5Story3 = Story.new(question: restaurantQuestion1, user: user_set.sample, content: "Sit at the bar", spot: spot5)
spot5_story3_photo = Photo.new
file = URI.open("https://res.cloudinary.com/daqhmzr2j/image/upload/v1592185100/d8c2eca0a9d251713ed3aedb410628f3_xh7q1n.jpg")
spot5_story3_photo.file.attach(io: file, filename: "spot5_story3_photo.jpg", content_type: 'image/jpg')
spot5_story3_photo.photoable = spot5Story3
spot5_story3_photo.save!
spot5Story3.save!

puts "Finished Spot 5!"

################################################################################
################################################################################
puts "Creating spot 6..."
spot6 = Spot.new(name: "Los Hermanos", location: "339 Victoria St, Brunswick VIC 3056", category: restaurantCategory)
spot_set << spot6
puts "Adding Photos to Spot 6..."
spot6_photo1 = Photo.new
file = URI.open("https://res.cloudinary.com/daqhmzr2j/image/upload/v1592264542/5bb21da306f3d8b9de507289b962b5dc_xuykvv.jpg")
spot6_photo1.file.attach(io: file, filename: "spot6_photo1.jpg", content_type: 'image/jpg')

spot6_photo2 = Photo.new
file = URI.open("https://res.cloudinary.com/daqhmzr2j/image/upload/v1592264541/los-hermanos_okuibx.jpg")
spot6_photo2.file.attach(io: file, filename: "spot6_photo2.jpg", content_type: 'image/jpg')

spot6_photo3 = Photo.new
file = URI.open("https://res.cloudinary.com/daqhmzr2j/image/upload/v1592264541/los-hermanos_okuibx.jpg")
spot6_photo3.file.attach(io: file, filename: "spot6_photo3.jpg", content_type: 'image/jpg')
spot6.photos = [spot6_photo1, spot6_photo2, spot6_photo3]
spot6.save!

############################################
puts "Adding Stories to Spot 6..."

spot6Story1 = Story.new(question: restaurantQuestion1, user: user_set.sample, content: "Best fish tacos in Melbourne", spot: spot6)
spot6_story1_photo = Photo.new
file = URI.open("https://res.cloudinary.com/daqhmzr2j/image/upload/v1592264542/5bb21da306f3d8b9de507289b962b5dc_xuykvv.jpg")
spot6_story1_photo.file.attach(io: file, filename: "spot6_story1_photo.jpg", content_type: 'image/jpg')
spot6_story1_photo.photoable = spot6Story1
spot6_story1_photo.save!
spot6Story1.save!


spot6Story2 = Story.new(question: restaurantQuestion1, user: user_set.sample, content: "Too much tequila", spot: spot6)
spot6_story2_photo = Photo.new
file = URI.open("https://res.cloudinary.com/daqhmzr2j/image/upload/v1592264542/5bb21da306f3d8b9de507289b962b5dc_xuykvv.jpg")
spot6_story2_photo.file.attach(io: file, filename: "spot6_story2_photo.jpg", content_type: 'image/jpg')
spot6_story2_photo.photoable = spot6Story2
spot6_story2_photo.save!
spot6Story2.save!

spot6Story3 = Story.new(question: restaurantQuestion1, user: user_set.sample, content: "Make sure you order the fish tacos", spot: spot6)
spot6_story3_photo = Photo.new
file = URI.open("https://res.cloudinary.com/daqhmzr2j/image/upload/v1592264542/5bb21da306f3d8b9de507289b962b5dc_xuykvv.jpg")
spot6_story3_photo.file.attach(io: file, filename: "spot6_story3_photo.jpg", content_type: 'image/jpg')
spot6_story3_photo.photoable = spot6Story3
spot6_story3_photo.save!
spot6Story3.save!

puts "Finished Spot 6!"

################################################################################
################################################################################
puts "Creating spot 7..."
spot7 = Spot.new(name: "Fairfield Boat House", location: "Fairfield Park Dr, Fairfield VIC 3078", category: outdoorCategory)
spot_set << spot7
puts "Adding Photos to Spot 7..."
spot7_photo1 = Photo.new
file = URI.open("https://res.cloudinary.com/daqhmzr2j/image/upload/v1592269599/Fairfield_Boathouse_Mamma_Knows_North_1_of_10_czpax2.jpg")
spot7_photo1.file.attach(io: file, filename: "spot7_photo1.jpg", content_type: 'image/jpg')

spot7_photo2 = Photo.new
file = URI.open("https://res.cloudinary.com/daqhmzr2j/image/upload/v1592269641/main_dgc3gd.png")
spot7_photo2.file.attach(io: file, filename: "spot7_photo2.jpg", content_type: 'image/jpg')

spot7_photo3 = Photo.new
file = URI.open("https://res.cloudinary.com/daqhmzr2j/image/upload/v1592269644/fairfield-boat-house-yarra-river11_s2z1xy.jpg")
spot7_photo3.file.attach(io: file, filename: "spot7_photo3.jpg", content_type: 'image/jpg')
spot7.photos = [spot7_photo1, spot7_photo2, spot7_photo3]
spot7.save!

############################################
puts "Adding Stories to Spot 7..."

spot7Story1 = Story.new(question: outdoorQuestion1, user: user_set.sample, content: "This is such a fun acitivity on a sunny day. Pack a couple of bottles and some snacks and your afternoon is sorted", spot: spot7)
spot7_story1_photo = Photo.new
file = URI.open("https://res.cloudinary.com/daqhmzr2j/image/upload/v1592269644/fairfield-boat-house-yarra-river11_s2z1xy.jpg")
spot7_story1_photo.file.attach(io: file, filename: "spot7_story1_photo.jpg", content_type: 'image/jpg')
spot7_story1_photo.photoable = spot7Story1
spot7_story1_photo.save!
spot7Story1.save!

spot7Story2 = Story.new(question: outdoorQuestion1, user: user_set.sample, content: "I got taken on a date here, it was a great idea however we were stuck on a boat together...", spot: spot7)
spot7_story2_photo = Photo.new
file = URI.open("https://res.cloudinary.com/daqhmzr2j/image/upload/v1592269641/main_dgc3gd.png")
spot7_story2_photo.file.attach(io: file, filename: "spot7_story2_photo.jpg", content_type: 'image/jpg')
spot7_story2_photo.photoable = spot7Story2
spot7_story2_photo.save!
spot7Story2.save!

spot7Story3 = Story.new(question: outdoorQuestion1, user: user_set.sample, content: "So much fun, we took our dog out on the boats", spot: spot7)
spot7_story3_photo = Photo.new
file = URI.open("https://res.cloudinary.com/daqhmzr2j/image/upload/v1592269599/Fairfield_Boathouse_Mamma_Knows_North_1_of_10_czpax2.jpg")
spot7_story3_photo.file.attach(io: file, filename: "spot7_story3_photo.jpg", content_type: 'image/jpg')
spot7_story3_photo.photoable = spot7Story3
spot7_story3_photo.save!
spot7Story3.save!

puts "Finished Spot 7!"

################################################################################
################################################################################
puts "Creating spot 8..."
spot8 = Spot.new(name: "Burnside", location: "87A Smith St, Fitzroy VIC 3065", category: cafeCategory)
spot_set << spot8
puts "Adding Photos to Spot 8..."
spot8_photo1 = Photo.new
file = URI.open("https://res.cloudinary.com/daqhmzr2j/image/upload/v1592270045/Sprudge-Burnside-EileenKenny-IMG_2409_1_bou82c.jpg")
spot8_photo1.file.attach(io: file, filename: "spot8_photo1.jpg", content_type: 'image/jpg')

spot8_photo2 = Photo.new
file = URI.open("https://res.cloudinary.com/daqhmzr2j/image/upload/v1592270043/60ae4d6695088577ad34efa92cee2a27_s57uw1.jpg")
spot8_photo2.file.attach(io: file, filename: "spot8_photo2.jpg", content_type: 'image/jpg')

spot8_photo3 = Photo.new
file = URI.open("https://res.cloudinary.com/daqhmzr2j/image/upload/v1592270043/60ae4d6695088577ad34efa92cee2a27_s57uw1.jpg")
spot8_photo3.file.attach(io: file, filename: "spot7_photo3.jpg", content_type: 'image/jpg')
spot8.photos = [spot8_photo1, spot8_photo2, spot8_photo3]
spot8.save!

############################################
puts "Adding Stories to Spot 8..."

spot8Story1 = Story.new(question: cafeQuestion1, user: user_set.sample, content: "I get a long black and a sandwich. Top blokes", spot: spot8)
spot8_story1_photo = Photo.new
file = URI.open("https://res.cloudinary.com/daqhmzr2j/image/upload/v1592270045/Sprudge-Burnside-EileenKenny-IMG_2409_1_bou82c.jpg")
spot8_story1_photo.file.attach(io: file, filename: "spot8_story1_photo.jpg", content_type: 'image/jpg')
spot8_story1_photo.photoable = spot8Story1
spot8_story1_photo.save!
spot8Story1.save!

spot8Story2 = Story.new(question: cafeQuestion1, user: user_set.sample, content: "Barristas are great, really great coffee", spot: spot8)
spot8_story2_photo = Photo.new
file = URI.open("https://res.cloudinary.com/daqhmzr2j/image/upload/v1592269641/main_dgc3gd.png")
spot8_story2_photo.file.attach(io: file, filename: "spot8_story2_photo.jpg", content_type: 'image/jpg')
spot8_story2_photo.photoable = spot8Story2
spot8_story2_photo.save!
spot8Story2.save!

spot8Story3 = Story.new(question: cafeQuestion1, user: user_set.sample, content: "Great spot for a quick coffee and pastry", spot: spot8)
spot8_story3_photo = Photo.new
file = URI.open("https://res.cloudinary.com/daqhmzr2j/image/upload/v1592269599/Fairfield_Boathouse_Mamma_Knows_North_1_of_10_czpax2.jpg")
spot8_story3_photo.file.attach(io: file, filename: "spot8_story3_photo.jpg", content_type: 'image/jpg')
spot8_story3_photo.photoable = spot8Story3
spot8_story3_photo.save!
spot8Story3.save!

puts "Finished Spot 8!"

################################################################################
################################################################################
puts "Creating Spot 9..."
spot9 = Spot.new(name: "Tidal River Campground", location: "Tidal River", category: campingCategory)
spot_set << spot9

puts "Adding Photos to Spot 9..."
spot9_photo1 = Photo.new
file = URI.open("https://res.cloudinary.com/daqhmzr2j/image/upload/v1592443138/tidal_river_2_jyovaa.jpg")
spot9_photo1.file.attach(io: file, filename: "spot9_photo1.jpg", content_type: 'image/jpg')


spot9_photo2 = Photo.new
file = URI.open("https://res.cloudinary.com/daqhmzr2j/image/upload/v1592265682/51890742_zumoky.jpg")
spot9_photo2.file.attach(io: file, filename: "spot9_photo2.jpg", content_type: 'image/jpg')

spot9_photo3 = Photo.new
file = URI.open("https://res.cloudinary.com/daqhmzr2j/image/upload/v1592443333/tidal3_qnkli3.jpg")
spot9_photo3.file.attach(io: file, filename: "spot9_photo3.jpg", content_type: 'image/jpg')
spot9.photos = [spot9_photo1, spot9_photo2, spot9_photo3]
spot9.save!

############################################
puts "Adding Stories to Spot 9..."

spot9Story1 = Story.new(question: campingQuestion1, user: user_set.sample, content: "Tidal River is great. On the one side you’ve got the clear waters of Tidal River, and on the other, there’s Norman Beach, one of the best in the national park. Tidal River gets busy, so you’ll want to book ahead.", spot: spot9)
spot9_story1_photo = Photo.new
file = URI.open("https://res.cloudinary.com/daqhmzr2j/image/upload/v1592443138/tidal_river_2_jyovaa.jpg")
spot9_story1_photo.file.attach(io: file, filename: "spot9_story1_photo.jpg", content_type: 'image/jpg')
spot9_story1_photo.photoable = spot9Story1
spot9_story1_photo.save!
spot9Story1.save!

spot9Story2 = Story.new(question: campingQuestion2, user: user_set.sample, content: "This place is amazing. We camped in our new tents. We saw so many kangaroos! There’s room for nearly 500 tents, but they go quick in the summertime.", spot: spot9)
spot9_story2_photo = Photo.new
file = URI.open("https://res.cloudinary.com/daqhmzr2j/image/upload/v1592443138/tidal_river_iz0qhj.jpg")
spot9_story2_photo.file.attach(io: file, filename: "spot9_story2_photo.jpg", content_type: 'image/jpg')
spot9_story2_photo.photoable = spot9Story2
spot9_story2_photo.save!
spot9Story2.save!

spot9Story3 = Story.new(question: campingQuestion2, user: user_set.sample, content: "Tidal River is one of the few campgrounds we know with its own pop-up cinema. There’s also gas barbies, hot showers and dishwashing stations. Luxe.", spot: spot9)
spot9_story3_photo = Photo.new
file = URI.open("https://res.cloudinary.com/daqhmzr2j/image/upload/v1592443333/tidal3_qnkli3.jpg")
spot9_story3_photo.file.attach(io: file, filename: "spot9_story3_photo.jpg", content_type: 'image/jpg')
spot9_story3_photo.photoable = spot9Story3
spot9_story3_photo.save!
spot9Story3.save!


################################################################################
################################################################################
puts "Creating Spot 10..."
spot10 = Spot.new(name: "Sealers Cove", location: "Sealers Cove", category: campingCategory)
spot_set << spot10

puts "Adding Photos to Spot 10..."
spot10_photo1 = Photo.new
file = URI.open("https://res.cloudinary.com/daqhmzr2j/image/upload/v1592443955/0082_001_icun5h.jpg")
spot10_photo1.file.attach(io: file, filename: "spot10_photo1.jpg", content_type: 'image/jpg')


spot10_photo2 = Photo.new
file = URI.open("https://res.cloudinary.com/daqhmzr2j/image/upload/v1592443955/0074_001_zip24f.jpg")
spot10_photo2.file.attach(io: file, filename: "spot10_photo2.jpg", content_type: 'image/jpg')

spot10_photo3 = Photo.new
file = URI.open("https://res.cloudinary.com/daqhmzr2j/image/upload/v1592443333/tidal3_qnkli3.jpg")
spot10_photo3.file.attach(io: file, filename: "spot10_photo3.jpg", content_type: 'image/jpg')
spot10.photos = [spot10_photo1, spot10_photo2, spot10_photo3]
spot10.save!

############################################
puts "Adding Stories to Spot 10..."

spot10Story1 = Story.new(question: campingQuestion1, user: user_set.sample, content: "Perfect if you’re looking for a Prom date without the crowds. You have to hike-in to the campsite, which means it’s out of reach for the average boombox-wielding campervan.", spot: spot10)
spot10_story1_photo = Photo.new
file = URI.open("https://res.cloudinary.com/daqhmzr2j/image/upload/v1592443955/0082_001_icun5h.jpg")
spot10_story1_photo.file.attach(io: file, filename: "spot10_story1_photo.jpg", content_type: 'image/jpg')
spot10_story1_photo.photoable = spot10Story1
spot10_story1_photo.save!
spot10Story1.save!

spot10Story2 = Story.new(question: campingQuestion2, user: user_set.sample, content: "We went here with a few friends.This place is a hideen gem. If you're after solitude and scenery you will get both in abundance.", spot: spot10)
spot10_story2_photo = Photo.new
file = URI.open("https://res.cloudinary.com/daqhmzr2j/image/upload/v1592443955/0074_001_zip24f.jpg")
spot10_story2_photo.file.attach(io: file, filename: "spot10_story2_photo.jpg", content_type: 'image/jpg')
spot10_story2_photo.photoable = spot10Story2
spot10_story2_photo.save!
spot10Story2.save!

spot10Story3 = Story.new(question: campingQuestion1, user: user_set.sample, content: "Two city girls go on a hike and forget to pack water! Thank goodness for the kind couple we ran into who gave us their extra bottles. FYI BYO water!!!", spot: spot10)
spot10_story3_photo = Photo.new
file = URI.open("https://res.cloudinary.com/daqhmzr2j/image/upload/v1592443955/0082_001_icun5h.jpg")
spot10_story3_photo.file.attach(io: file, filename: "spot10_story3_photo.jpg", content_type: 'image/jpg')
spot10_story3_photo.photoable = spot10Story3
spot10_story3_photo.save!
spot10Story3.save!


puts "Adding some favourites"


user_set.each do |user|
  spot_set.sample(rand(2..4)).each do |spot|
    Favourite.create!(user: user, spot: spot)
  end
end
