# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Creating Users'
user_set = []

puts "Creating Georgie"
georgie = User.create!(
  first_name: 'Georgie',
  last_name: 'Brown',
  email: 'georgie@gmail.com',
  password: 'password',
  bio: '28 years old, Software developer'
  )
file = URI.open("https://cdn.vox-cdn.com/thumbor/sK3gMTENF_LR1DhAUl9e3V_5jC4=/0x0:2592x2017/1200x800/filters:focal(1089x801:1503x1215)/cdn.vox-cdn.com/uploads/chorus_image/image/65282724/friendscast.0.0.1429818191.0.jpg")
georgie.photo.attach(io: file, filename: "#{georgie.name}.jpg", content_type: 'image/jpg')

user_set << georgie
georgie.save!
puts "added #{georgie.name} with photo"


puts "Creating Rob"
rob = User.create!(
  first_name: 'Rob',
  last_name: 'Chapman',
  email: 'rob@gmail.com',
  password: 'password',
  bio: ''
  )
file = URI.open("https://cdn.vox-cdn.com/thumbor/sK3gMTENF_LR1DhAUl9e3V_5jC4=/0x0:2592x2017/1200x800/filters:focal(1089x801:1503x1215)/cdn.vox-cdn.com/uploads/chorus_image/image/65282724/friendscast.0.0.1429818191.0.jpg")
rob.photo.attach(io: file, filename: "#{rob.name}.jpg", content_type: 'image/jpg')

user_set << rob
rob.save!
puts "added #{rob.name} with photo"


puts "Creating Keiichi"
keiichi = User.create!(
  first_name: 'Keiichi',
  last_name: 'Katsuno',
  email: 'keiichi@gmail.com',
  password: 'password',
  bio: 'Loves coffee'
  )

file = URI.open("https://cdn.vox-cdn.com/thumbor/sK3gMTENF_LR1DhAUl9e3V_5jC4=/0x0:2592x2017/1200x800/filters:focal(1089x801:1503x1215)/cdn.vox-cdn.com/uploads/chorus_image/image/65282724/friendscast.0.0.1429818191.0.jpg")
keiichi.photo.attach(io: file, filename: "#{keiichi.name}.jpg", content_type: 'image/jpg')

user_set << keiichi
keiichi.save!
puts "added #{keiichi.name} with photo"

puts "Creating Nesil"
nesil = User.create!(
  first_name: 'Nesil',
  last_name: 'Ozer',
  email: 'nesil@gmail.com',
  password: 'password',
  bio: ''
  )

file = URI.open("https://cdn.vox-cdn.com/thumbor/sK3gMTENF_LR1DhAUl9e3V_5jC4=/0x0:2592x2017/1200x800/filters:focal(1089x801:1503x1215)/cdn.vox-cdn.com/uploads/chorus_image/image/65282724/friendscast.0.0.1429818191.0.jpg")
nesil.photo.attach(io: file, filename: "#{nesil.name}.jpg", content_type: 'image/jpg')

user_set << nesil
nesil.save!
puts "added #{nesil.name} with photo"
