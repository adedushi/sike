# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "open-uri"

# ApplicationRecord.transaction do 
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
  air_force = Product.create!(
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
  air_force.photos.attach(
    io: URI.open("https://sike-seeds.s3.amazonaws.com/air-jordan-1-retro-high-og-mens-shoes-JHpxkn.jpeg"), 
    filename: "jordan1.jpeg"
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

  Product.create!(
  name: "Nike Alpha Huarache Elite 4 Low MCS",
  subtitle: "Men's Baseball Cleats",
  description: "Let the baseball world know what kind of bat-wielding beast you are. The midsole has Nike React technology, perfect for sprinting around the bags or robbing your opponent of extra bases. The plush, breathable upper helps secure your foot without adding any unnecessary weight. Plus, the grippy traction is tailor-made for all-out effort plays.",
  list_price: 95.00,
  sale_price: nil, 
  article_number: "FQ7724-104",
  division: "Men", 
  category: "Shoes", 
  sub_category: "Baseball"
)

Product.create!(
  name: "Nike Force Zoom Trout 9 Pro",
  subtitle: "Baseball Cleats",
  description: "You want to be great? Go do it all on the field, fast, with force, just like Mike Trout. The Trout 9 is lighter, stronger and more comfortable than the previous iteration. Most of all? It's now a low-top design, harkening back to Trout’s favorite cleat as a rookie. With a brand-new upper and a revamped midsole, it can help you leave a permanent imprint on the game. What’s your legacy going to be?",
  list_price: 90.00,
  sale_price: nil,
  article_number: "FB2907-100",
  division: "Men",
  category: "Shoes",
  sub_category: "Baseball"
)

Product.create!(
  name: "Jordan ADG 4 x Eastside Golf",
  subtitle: "Men's Golf Shoes",
  description: "A request from MJ himself, the Jordan 4 ADG infuses a classic shoe with retro Jordan flavor. Soft full-grain leather shows off the iconic elephant print on the heel. The rubber sole has a traction pattern that pairs the grip you need with the versatility and comfort you want. This collaboration with Eastside Golf celebrates the love of both games.",
  list_price: 205.00,
  sale_price: nil,
  article_number: "FJ0850-001",
  division: "Men",
  category: "Shoes",
  sub_category: "Golf"
)

Product.create!(
  name: "Nike In-Season TR 13",
  subtitle: "Men's Workout Shoes",
  description: "When time is of the essence, but your workout can’t wait any longer, ride with the Nike In-Season TR 13. It offers versatility, the kind that can carry you from a hard-hitting HIIT class to the treadmill and turn a squeezed-in gym session into sweat-soaked satisfaction. Whether you’re moving laterally or deepening your cardio base by reeling in a few miles in front of you, the energy return helps you reap what you sow.",
  list_price: 85.00,
  sale_price: 67.97,
  article_number: "DZ9360-001",
  division: "Men",
  category: " Shoes",
  sub_category: "Workouts"
)

Product.create!(
  name: "Nike Dunk Low",
  subtitle: "Women's Shoes",
  description: "Created for the hardwood but taken to the streets, the '80s b-ball icon returns with perfectly shined overlays and classic team colors. With its iconic hoops design, the Nike Dunk Low channels '80s vintage back onto the streets while its padded, low-cut collar lets you take your game anywhere—in comfort.",
  list_price: 115.00,
  sale_price: nil,
  article_number: "DD1503-101",
  division: "Women",
  category: "Shoes",
  sub_category: "Lifestyle"
)

Product.create!(
  name: "Nike Air Max SC",
  subtitle: "Women's Shoes",
  description: "With its easy going lines, heritage track look and of course, visible Air cushioning, the Nike Air Max SC is the perfect finish to any outfit. The rich mixture of materials adds depth while making it a durable and lightweight shoe for everyday wear.",
  list_price: 90.00,
  sale_price: nil,
  article_number: "CW4554-500",
  division: "Women",
  category: "Shoes",
  sub_category: "Lifestyle"
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
# end