# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Reviews.delete_all
# puts "deleting reviews"
Post.delete_all
puts "deleting Posts"
User.delete_all
puts "creating Users"
user1 = User.create(email: "zlatko@admin.com", password: "123123", name: "admin1", zipcode: "1071 ET")
user2 = User.create(email: "anna@admin.com", password: "123123", name: "admin2", zipcode: "1021 GG")
user3 = User.create(email: "vincent@admin.com", password: "123123", name: "admin3", zipcode: "1016 AA")
puts "creating posts"
post1 =
Post.create!(
  title: "Need help with my garden",
  category: "gardening",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
  user_id: user1.id,
  solved: false,
  asker: true
)
Post.create!(
  title: "Can someone help me with the dishes?",
  category: "household",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
  user_id: user2.id,
  solved: false,
  asker: true
)

Post.create!(
  title: "Could someone please help me with the grocery shopping?",
  category: "household",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
  user_id: user2.id,
  solved: false,
  asker: true
)

Post.create!(
  title: "Can someone help me with the dusting?",
  category: "household",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
  user_id: user3.id,
  solved: false,
  asker: true
)

Post.create!(
  title: "Need help with hanging the picture on the wall",
  category: "household",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
  user_id: user3.id,
  solved: false,
  asker: true
)
puts "creating posts"


Review.create!(user_id: user1.id, post_id: post1.id, asker_rating: 5, helper_rating: 5, asker_comment: "Great help!", helper_comment: "Great help!")
puts "Done creating"
