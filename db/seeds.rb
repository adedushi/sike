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

  Product.create!(
    name: "Nike Sportswear Everything Wovens",
    subtitle: "Women's Oversized Hooded Jacket",
    description: "Designed with simplicity and functionality in mind, the cinchable waist means you can tighten the jacket for a more tailored fit or wear it loose for easy layering. Plus, we added a water-repellent coating to the crinkled fabric so you’re always ready for rain. It’s got everything you need to cover up in style.",
    list_price: 120.00,
    sale_price: nil,
    article_number: "FN3669-208",
    division: "Women",
    category: "Clothing",
    sub_category: "Workouts"
  )

  Product.create!(
    name: "Nike Dunk Low", 
    subtitle: "Big Kids' Shoes",
    description: "Show love to the ‘80s with the Nike Dunk Low. From the super durable build to the shoe’s classic shape and feel, we honor this hardwood icon that’ll fit easily into your kicks collection and is always ready to play.",
    list_price: 90.00,
    sale_price: 76.97,
    article_number: "DH9765-104",
    division: "Kids",
    category: "Shoes",
    sub_category: "Lifestyle"
  )

  Product.create!(
    name: "Nike Club Elite Team",
    subtitle: "Soccer Ball",
    description: "The Nike Club Elite Team Soccer Ball is ready to fly into the back of the net. A textured casing with stabilizing grooves gives you consistent touch when passing, shooting and dribbling.",
    list_price: 62.00,
    sale_price: nil,
    article_number: "CU8053-100",
    division: "Unisex",
    category: "Accessories",
    sub_category: "Soccer"
  )

  #   Product.create!(
  #   name: 
  #   subtitle: 
  #   description: 
  #   list_price: 
  #   sale_price:
  #   article_number: 
  #   division: 
  #   category:
  #   sub_category: 
  # )



  puts "Done!"
end