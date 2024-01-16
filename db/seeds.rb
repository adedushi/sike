# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ApplicationRecord.transaction do 
  puts "Destroying tables..."
  # Unnecessary if using `rails db:seed:replant`
  User.destroy_all
  Product.destroy_all

  puts "Resetting primary keys..."
  ApplicationRecord.connection.reset_pk_sequence!('users')
  ApplicationRecord.connection.reset_pk_sequence!('products')

  puts "Creating users..."
  User.create!(
    email: 'michael@jordan.com', 
    password: 'Jordan23',
    first_name: 'Michael',
    last_name: 'Jordan'

  )

  10.times do 
    User.create!({
      email: Faker::Internet.unique.email,
      password: 'passwordA1',
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name
    }) 
  end

  puts "Creating products..."
  Product.create!(
    name: "Nike Air Force 1 '07",
    subtitle: "Men's Shoes",
    description: "The radiance lives on in the Nike Air Force 1 ’07, the b-ball OG that puts a fresh spin on what you know best: durably stitched overlays, clean finishes and the perfect amount of flash to make you shine.",
    list_price: 115.00,
    sale_price: nil,
    article_number: "CW2288-111",
    division: "Men",
    category: "Shoes",
    sub_category: "Lifestyle"
  )

  puts "Done!"
end