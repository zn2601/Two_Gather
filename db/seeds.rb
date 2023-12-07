# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "open-uri"
Message.delete_all
puts "deleting Messages"
Chatroom.delete_all
puts "deleting Chatrooms"
Review.delete_all
puts "deleting Reviews"
Post.delete_all
puts "deleting Posts"
User.delete_all
puts "creating Users"
file = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1697783736/l7u70pgpxnsy1boxbl8u.jpg")
user1 = User.create(email: "zlatko@admin.com", password: "123123", name: "Zlatko", zipcode: "1071 ET", about_me: "Hello neighbors! I'm Zlatko, your friendly organizer and event planner. From block parties to community clean-ups, I'm here to turn ideas into reality and create a vibrant neighborhood where everyone feels involved. Let's plan and celebrate together!")
user1.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
user1.save

file = URI.open("https://avatars.githubusercontent.com/u/111053814?v=4")
user2 = User.create(email: "anna@admin.com", password: "123123", name: "Anna", zipcode: "1021 GG", about_me: "Hello, fellow neighbors! I'm Anna, your friendly fitness fanatic. Whether you need a jogging buddy or someone to join your home workout, I'm here to promote health and well-being in our community. Let's stay active together!")
user2.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
user2.save

file = URI.open("https://avatars.githubusercontent.com/u/144326573?v=4")
user3 = User.create(email: "vincent@admin.com", password: "123123", name: "Vincent", zipcode: "1016 AA", about_me: "Hey neighbors! I'm Vincent, your resident dog lover and aspiring chef. Need a furry friend walked or a homemade meal? I'm your person! Let's create a vibrant community where kindness and assistance are the main ingredients.")
user3.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
user3.save

file = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1696579981/brnudrd8aayjmsfblj14.jpg")
user4 = User.create(email: "user4@admin.com", password: "123123", name: "Robert", zipcode: "1015 GN", about_me: "Hi there! 👋 I'm Robert, your friendly neighborhood enthusiast! Whether it's watering plants, fixing a leaky faucet, or just lending a hand, count on me to make our community a better place, one task at a time. Let's build a stronger, more connected neighborhood together!")
user4.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
user4.save

file = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1696788410/n9jejlovor1umficj3c5.jpg")
user5 = User.create(email: "user5@admin.com", password: "123123", name: "Felipe", zipcode: "1017 RV", about_me: "Hey there! I'm Felipe, your local music maestro. Whether you need a guitar lesson or someone to jam with, I'm here to harmonize our community. Let's make beautiful music and lasting connections together!")
user5.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
user5.save

file = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1696857181/df6mf1n0gbv93bdqez2k.jpg")
user6 = User.create(email: "user6@admin.com", password: "123123", name: "Riru", zipcode: "1011 AK", about_me: "Greetings, neighbors! I'm Riru, a DIY enthusiast and problem solver. From fixing squeaky doors to tackling minor home repairs, count on me to keep our community in tip-top shape. Let's build a neighborhood where everyone feels supported and secure.")
user6.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
user6.save

file = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1696848020/mr3yz2xiyfdubzp4cq7o.jpg")
user7 = User.create(email: "user7@admin.com", password: "123123", name: "Rita", zipcode: "1016 DX", about_me: "Greetings! I'm Rita, your go-to person for all things handy. From assembling furniture to organizing community events, I'm here to foster a sense of togetherness. Let's make our neighborhood a place where everyone feels heard and supported!")
user7.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
user7.save

file = URI.open("https://avatars.githubusercontent.com/u/147380890?v=4")
user8 = User.create(email: "user8@admin.com", password: "123123", name: "Tom", zipcode: "1013 JW", about_me: "Greetings from your resident bookworm! I'm Tom, always ready to recommend a good read or help organize a community book club. Let's create a literary haven where neighbors bond over stories and shared interests.")
user8.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
user8.save

file = URI.open("https://avatars.githubusercontent.com/u/62124863?v=4")
user9 = User.create(email: "user9@admin.com", password: "123123", name: "Sofia", zipcode: "1018 XA", about_me: "I'm Sofia, your arts and crafts aficionado. From hosting DIY workshops to helping with creative projects, I'm here to add a touch of color and creativity to our community. Let's craft a close-knit neighborhood!")
user9.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
user9.save

file = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1697736062/nz0llrdssotizn0hrtno.jpg")
user10 = User.create(email: "user10@admin.com", password: "123123", name: "Tobias", zipcode: "1014 BV", about_me: "Hey, it's Tobias, your resident chef with a passion for cooking up community connections. Whether you need a hand in the kitchen or want to share a meal, count on me to spice up our neighborhood with good food and great company!")
user10.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
user10.save

file = URI.open("https://avatars.githubusercontent.com/u/143593700?v=4")
user11 = User.create(email: "user11@admin.com", password: "123123", name: "Nivea", zipcode: "1017 XN", about_me: "Howdy! I'm Nivea, your local green thumb with a passion for gardening. Whether you need help planting flowers or advice on your tomato plants, I'm here to cultivate a sense of belonging in our community. Let's grow together!")
user11.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
user11.save

file = URI.open("https://avatars.githubusercontent.com/u/147411473?v=4")
user12 = User.create(email: "user12@admin.com", password: "123123", name: "Eleni", zipcode: "1016 HE", about_me: "Hi everyone! I'm Eleni, a tech guru with a knack for troubleshooting. From setting up your new gadgets to solving computer glitches, I'm here to make our community tech-savvy and connected. Let's navigate the digital world together!")
user12.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
user12.save

puts "creating posts"
post1 =
Post.create!(
  title: "Need Quick Recipe Ideas",
  category: "cooking",
  description: "Running out of dinner inspiration after a long day. Any favorite easy recipes to share? Preferably something quick and delicious. Open to all cuisines!",
  user_id: user1.id,
  solved: false,
  asker: true
)
Post.create!(
  title: "Gardening Tips Needed",
  category: "gardening",
  description: "I'm a newbie gardener seeking advice on growing tomatoes in a small backyard. Any green thumbs out there willing to share tips on soil, watering, and sunlight?",
  user_id: user2.id,
  solved: false,
  asker: true
)

Post.create!(
  title: "Babysitter Cancellation",
  category: "other",
  description: "Urgently need a babysitter tonight! Last-minute cancellation, and we have plans. Our kids are well-behaved; just need someone trustworthy for a few hours.",
  user_id: user3.id,
  solved: false,
  asker: true
)

Post.create!(
  title: "Bike Repair Help",
  category: "DIY",
  description: "Disaster struck on my commute! Flat tire on my bike, and I'm clueless about repairs. Anyone skilled in bike repairs willing to lend a hand or share tools?",
  user_id: user4.id,
  solved: false,
  asker: true
)

Post.create!(
  title: "Friendly neigbothood computer-man",
  category: "tech",
  description: "Just got a fancy degree as a fullstack-developer. Anyone who has computer problems can knock at my door!",
  user_id: user5.id,
  solved: false,
  asker: false
)

Post.create!(
  title: "Artistic Advice Needed",
  category: "DIY",
  description: "Working on a DIY art project but feeling stuck. Any artists or creatives able to offer guidance on color schemes and techniques?",
  user_id: user6.id,
  solved: false,
  asker: true
)

Post.create!(
  title: "DIY Plumbing Woes",
  category: "DIY",
  description: "Leaky faucet crisis! Anyone with plumbing skills able to lend a hand? A quick fix could save me a call to the plumber. Tools and expertise appreciated!",
  user_id: user7.id,
  solved: false,
  asker: true
)

Post.create!(
  title: "Moving Assistance",
  category: "household",
  description: "Help needed moving furniture to a new place. Will provide snacks, drinks, and good company! Just a few strong arms required.",
  user_id: user8.id,
  solved: false,
  asker: true
)

Post.create!(
  title: "Need a fitness buddy?",
  category: "fitness",
  description: "Looking for a workout partner for evening walks around the neighborhood? I'm your gal. I'm doing it myself but wouldn't mind someone joining.",
  user_id: user9.id,
  solved: false,
  asker: false
)

Post.create!(
  title: "Home Organization Tips",
  category: "cleaning",
  description: "Overwhelmed with clutter and seeking advice on effective organization. Share your best organization hacks, please! From closets to kitchen spaces.",
  user_id: user10.id,
  solved: false,
  asker: true
)

Post.create!(
  title: "Tech Recycling",
  category: "other",
  description: "Have old electronics to recycle? Drop 'm with me! Let's ensure our old gadgets are disposed of responsibly. I'll take care of the rest ;)",
  user_id: user11.id,
  solved: false,
  asker: false
)

Post.create!(
  title: "Painting Assistance",
  category: "DIY",
  description: "Painting a room but struggling with the edges? I can lend a steady hand for a few hours! Just provide the paint and tools and I'll be there :)",
  user_id: user12.id,
  solved: false,
  asker: false
)
puts "creating posts"

Review.create!(user_id: user3.id, post_id: post1.id, asker_rating: 5, helper_rating: 5, asker_comment: "Great help!", helper_comment: "Very nice to work with!")
puts "Done creating"
