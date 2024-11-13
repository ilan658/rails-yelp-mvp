# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb

puts "Cleaning database..."
Restaurant.destroy_all

puts "Creating restaurants..."

restaurants = [
  { name: "Epicure", address: "75008 Paris", phone_number: "0123456789", category: "french" },
  { name: "Sushi Samba", address: "Tokyo", phone_number: "0987654321", category: "japanese" },
  { name: "Pasta Palace", address: "Rome", phone_number: "1234567890", category: "italian" },
  { name: "Waffles & More", address: "Brussels", phone_number: "2345678901", category: "belgian" },
  { name: "Dragon Garden", address: "Beijing", phone_number: "3456789012", category: "chinese" }
]

restaurants.each do |restaurant_data|
  restaurant = Restaurant.create!(restaurant_data)
  puts "Created #{restaurant.name}"
end

puts "Finished!"
