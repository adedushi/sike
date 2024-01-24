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
  CartItem.destroy_all
  User.destroy_all
  Product.destroy_all

  puts "Resetting primary keys..."
  ApplicationRecord.connection.reset_pk_sequence!('cart_items')
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
#   Product.create!(
#     name: "Nike Air Force 1 '07",
#     subtitle: "Men's Shoes",
#     description: "The radiance lives on in the Nike Air Force 1 ’07, the b-ball OG that puts a fresh spin on what you know best: durably stitched overlays, clean finishes and the perfect amount of flash to make you shine.",
#     list_price: 115.00,
#     sale_price: nil,
#     article_number: "CW2288-111",
#     division: "Men",
#     category: "Shoes",
#     sub_category: "Lifestyle"
#   )

#     # air_force.photos.attach(
#     # io: URI.open("https://sike-seeds.s3.amazonaws.com/air-jordan-1-retro-high-og-mens-shoes-JHpxkn.jpeg"), 
#     # filename: "jordan1.jpeg"
#     # )

#   # image_urls.each do |image, index|
#   #   air_force.photos.attach(
#   #   io: URI.open(image), 
#   #   filename: "photo1.index"
#   #   )
#   # end


#   Product.create!(
#     name: "Nike Sportswear Everything Wovens",
#     subtitle: "Women's Oversized Hooded Jacket",
#     description: "Designed with simplicity and functionality in mind, the cinchable waist means you can tighten the jacket for a more tailored fit or wear it loose for easy layering. Plus, we added a water-repellent coating to the crinkled fabric so you’re always ready for rain. It’s got everything you need to cover up in style.",
#     list_price: 120.00,
#     sale_price: nil,
#     article_number: "FN3669-208",
#     division: "Women",
#     category: "Clothing",
#     sub_category: "Workouts"
#   )

#   Product.create!(
#     name: "Nike Dunk Low", 
#     subtitle: "Big Kids' Shoes",
#     description: "Show love to the ‘80s with the Nike Dunk Low. From the super durable build to the shoe’s classic shape and feel, we honor this hardwood icon that’ll fit easily into your kicks collection and is always ready to play.",
#     list_price: 90.00,
#     sale_price: 76.97,
#     article_number: "DH9765-104",
#     division: "Kids",
#     category: "Shoes",
#     sub_category: "Lifestyle"
#   )

#   Product.create!(
#     name: "Nike Club Elite Team",
#     subtitle: "Soccer Ball",
#     description: "The Nike Club Elite Team Soccer Ball is ready to fly into the back of the net. A textured casing with stabilizing grooves gives you consistent touch when passing, shooting and dribbling.",
#     list_price: 62.00,
#     sale_price: nil,
#     article_number: "CU8053-100",
#     division: "Unisex",
#     category: "Accessories",
#     sub_category: "Soccer"
#   )

#   Product.create!(
#   name: "Nike Alpha Huarache Elite 4 Low MCS",
#   subtitle: "Men's Baseball Cleats",
#   description: "Let the baseball world know what kind of bat-wielding beast you are. The midsole has Nike React technology, perfect for sprinting around the bags or robbing your opponent of extra bases. The plush, breathable upper helps secure your foot without adding any unnecessary weight. Plus, the grippy traction is tailor-made for all-out effort plays.",
#   list_price: 95.00,
#   sale_price: nil, 
#   article_number: "FQ7724-104",
#   division: "Men", 
#   category: "Shoes", 
#   sub_category: "Baseball"
# )

# Product.create!(
#   name: "Nike Force Zoom Trout 9 Pro",
#   subtitle: "Baseball Cleats",
#   description: "You want to be great? Go do it all on the field, fast, with force, just like Mike Trout. The Trout 9 is lighter, stronger and more comfortable than the previous iteration. Most of all? It's now a low-top design, harkening back to Trout’s favorite cleat as a rookie. With a brand-new upper and a revamped midsole, it can help you leave a permanent imprint on the game. What’s your legacy going to be?",
#   list_price: 90.00,
#   sale_price: nil,
#   article_number: "FB2907-100",
#   division: "Men",
#   category: "Shoes",
#   sub_category: "Baseball"
# )

# Product.create!(
#   name: "Jordan ADG 4 x Eastside Golf",
#   subtitle: "Men's Golf Shoes",
#   description: "A request from MJ himself, the Jordan 4 ADG infuses a classic shoe with retro Jordan flavor. Soft full-grain leather shows off the iconic elephant print on the heel. The rubber sole has a traction pattern that pairs the grip you need with the versatility and comfort you want. This collaboration with Eastside Golf celebrates the love of both games.",
#   list_price: 205.00,
#   sale_price: nil,
#   article_number: "FJ0850-001",
#   division: "Men",
#   category: "Shoes",
#   sub_category: "Golf"
# )

# Product.create!(
#   name: "Nike In-Season TR 13",
#   subtitle: "Men's Workout Shoes",
#   description: "When time is of the essence, but your workout can’t wait any longer, ride with the Nike In-Season TR 13. It offers versatility, the kind that can carry you from a hard-hitting HIIT class to the treadmill and turn a squeezed-in gym session into sweat-soaked satisfaction. Whether you’re moving laterally or deepening your cardio base by reeling in a few miles in front of you, the energy return helps you reap what you sow.",
#   list_price: 85.00,
#   sale_price: 67.97,
#   article_number: "DZ9360-001",
#   division: "Men",
#   category: " Shoes",
#   sub_category: "Workouts"
# )

# Product.create!(
#   name: "Nike Dunk Low",
#   subtitle: "Women's Shoes",
#   description: "Created for the hardwood but taken to the streets, the '80s b-ball icon returns with perfectly shined overlays and classic team colors. With its iconic hoops design, the Nike Dunk Low channels '80s vintage back onto the streets while its padded, low-cut collar lets you take your game anywhere—in comfort.",
#   list_price: 115.00,
#   sale_price: nil,
#   article_number: "DD1503-101",
#   division: "Women",
#   category: "Shoes",
#   sub_category: "Lifestyle"
# )

# Product.create!(
#   name: "Nike Air Max SC",
#   subtitle: "Women's Shoes",
#   description: "With its easy going lines, heritage track look and of course, visible Air cushioning, the Nike Air Max SC is the perfect finish to any outfit. The rich mixture of materials adds depth while making it a durable and lightweight shoe for everyday wear.",
#   list_price: 90.00,
#   sale_price: nil,
#   article_number: "CW4554-500",
#   division: "Women",
#   category: "Shoes",
#   sub_category: "Lifestyle"
# )

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

Product.create!(
  name: "Air Jordan 3 'Fear'",
  subtitle: "Men's Shoes",
  description: "Clean and supreme, the AJ3 returns with all of its classic style and grace. Quality leather in the upper—with that luxurious elephant print texture—combines with visible Nike Air in the sole to make a comfortable, everyday icon.",
  list_price: 210,
  sale_price: nil,
  article_number: "CT8532-080",
  division: "Men",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Dunk Low Retro",
  subtitle: "Men's Shoes",
  description: "Created for the hardwood but taken to the streets, the basketball icon returns with classic details and throwback hoops flair. Channeling '80s vibes, its padded, low-cut collar lets you take your game anywhere—in comfort.",
  list_price: 115,
  sale_price: 97.97,
  article_number: "DV0831-105",
  division: "Men",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Air Jordan 1 Low",
  subtitle: "Men's Shoes",
  description: "Inspired by the original that debuted in 1985, the Air Jordan 1 Low offers a clean, classic look that's familiar yet always fresh. With an iconic design that pairs perfectly with any 'fit, these kicks ensure you'll always be on point.",
  list_price: 115,
  sale_price: nil,
  article_number: "553558-161",
  division: "Men",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Killshot 2 Leather",
  subtitle: "Men's Shoe",
  description: "Inspired by the original low-profile tennis shoe, the Nike Killshot 2 updates the upper with a variety of textured leathers to create a fresh look. From soft suedes to smooth leathers with the perfect sheen, it's court-side attitude with a modern touch. To prove you're on top, the rubber gum sole adds the cherry on bottom.",
  list_price: 90,
  sale_price: nil,
  article_number: "432997-124",
  division: "Men",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Air Max 270",
  subtitle: "Men's Shoes",
  description: "Nike's first lifestyle Air Max brings you style, comfort and big attitude in the Nike Air Max 270. The design draws inspiration from Air Max icons, showcasing Nike's greatest innovation with its large window and fresh array of colors.",
  list_price: 160,
  sale_price: nil,
  article_number: "AH8050-107",
  division: "Men",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Cortez",
  subtitle: "Men's Shoes",
  description: "Was 1972. Now 2023. Sometimes more is better. Recrafting the revered look, we've refreshed the design with a wider toe area and firmer side panels so you can comfortably wear them day in, day out. Reengineered materials help prevent warping and add durability while maintaining the classic '72 shape you fell in love with. Lace up, because tradition keeps getting better.",
  list_price: 90,
  sale_price: nil,
  article_number: "DM4044-103",
  division: "Men",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Air Force 1 '07",
  subtitle: "Men's Shoes",
  description: "The radiance lives on in the Nike Air Force 1 ’07, the b-ball OG that puts a fresh spin on what you know best: durably stitched overlays, clean finishes and the perfect amount of flash to make you shine.",
  list_price: 115,
  sale_price: nil,
  article_number: "CW2288-111",
  division: "Men",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Air VaporMax 2023 Flyknit",
  subtitle: "Men's Shoes",
  description: "Have you ever walked on Air? Step into the Air VaporMax 2023 to see how it's done. The innovative tech is revealed through the perforated sockliner (pull it out to see more). The stretchy Flyknit upper is made with at least 20% recycled content by weight.",
  list_price: 210,
  sale_price: nil,
  article_number: "DV1678-008",
  division: "Men",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Air Jordan 1 Retro High OG",
  subtitle: "Men's Shoes",
  description: "The Air Jordan 1 Retro High remakes the classic sneaker, giving you a fresh look with a familiar feel. Premium materials with new colors and textures give modern expression to an all-time favorite.",
  list_price: 180,
  sale_price: nil,
  article_number: "DZ5485-701",
  division: "Men",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Air Max 90",
  subtitle: "Men's Shoes",
  description: "Lace up and feel the legacy in this champion running shoe that helped define the ‘90s. Worn by presidents, revolutionized through collabs and celebrated through rare colorways, its Waffle outsole, visible Nike Air cushioning and striking visuals keep it alive and well.",
  list_price: 130,
  sale_price: nil,
  article_number: "FB9658-400",
  division: "Men",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Air Max 90 GORE-TEX",
  subtitle: "Men's Shoes",
  description: "Lace up and feel the legacy. These AM90s will keep up with you on all your adventures thanks to a mix of GORE-TEX and mesh materials. Worn by presidents, revolutionized through collabs and celebrated through rare colorways, the Waffle sole, striking visuals and Nike Air cushioning keep it alive and well.",
  list_price: 160,
  sale_price: nil,
  article_number: "FD5810-101",
  division: "Men",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Dunk Low Retro",
  subtitle: "Men's Shoes",
  description: "Created for the hardwood but taken to the streets, the Nike Dunk Low Retro returns with crisp overlays and original team colors. This basketball icon channels '80s vibes with premium leather in the upper that looks good and breaks in even better. Modern footwear technology helps bring the comfort into the 21st century.",
  list_price: 115,
  sale_price: nil,
  article_number: "DD1391-100",
  division: "Men",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Dunk Low Retro",
  subtitle: "Men's Shoes",
  description: "Created for the hardwood but taken to the streets, this '80s icon returns with classic details and throwback hoops flair. The smooth leather upper provides a durable yet premium look and feel while a padded, low-cut collar and foam midsole let you comfortably take your game anywhere.",
  list_price: 115,
  sale_price: nil,
  article_number: "FB7160-161",
  division: "Men",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Air Max Pulse",
  subtitle: "Men's Shoes",
  description: "Mixing one part urban with one part tough, the Air Max Pulse brings an energetic look to the iconic Air Max line. It combines a textile-wrapped midsole and vacuum-sealed accents to boost its street cred. Point-loaded Nike Air cushioning—revamped from the incredibly plush Air Max 270—delivers the comfort you've come to trust. Throw them on with your best outfit and go to the max.",
  list_price: 150,
  sale_price: 99.97,
  article_number: "FQ8733-010",
  division: "Men",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike SB Chron 2 Canvas",
  subtitle: "Skate Shoes",
  description: "The Nike SB Chron 2 Canvas is the newest member of the Chron family. The revamped design includes a reshaped collar and heel for an improved fit—all while maintaining the comfort and performance you expect from Nike SB.",
  list_price: 65,
  sale_price: 48.97,
  article_number: "DM3494-301",
  division: "Men",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Court Legacy",
  subtitle: "Men's Shoes",
  description: "Honoring a history rooted in tennis culture, the Nike Court Legacy brings you a time-tested staple. Its pebbled upper, heritage stitching and retro Swoosh design let you blend sport and fashion. And, you get to do good by looking good.",
  list_price: 70,
  sale_price: nil,
  article_number: "DH3162-100",
  division: "Men",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Waffle Debut",
  subtitle: "Men's Shoes",
  description: "Retro gets modernized in the Nike Waffle Debut. Remember that smooth suede and nylon trend? It's back, along with the modernized 'wedge' midsole that feels incredibly plush. And to top it off, we've kept the classic on the bottom—the tried, true and trusted Waffle outsole—that adds traction, durability and heritage style to your step.",
  list_price: 75,
  sale_price: 63.97,
  article_number: "DH9522-003",
  division: "Men",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Dunk Low Retro Premium",
  subtitle: "Men's Shoes",
  description: "Created for the hardwood but taken to the streets, the '80s b-ball icon returns with classic details and throwback hoops flair. Channeling vintage style back onto the streets, its padded, low-cut collar lets you take your game anywhere—in comfort.",
  list_price: 125,
  sale_price: nil,
  article_number: "FB8895-600",
  division: "Men",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Air Max 90",
  subtitle: "Men's Shoes",
  description: "Nothing as fly, nothing as comfortable, nothing as proven. The Nike Air Max 90 stays true to its OG running roots with the iconic Waffle sole, stitched overlays and classic TPU details. Classic colors celebrate your fresh look while Max Air cushioning adds comfort to the journey.",
  list_price: 130,
  sale_price: nil,
  article_number: "CN8490-001",
  division: "Men",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Air Max 1",
  subtitle: "Men's Shoes",
  description: "Meet the leader of the pack. Walking on clouds above the noise, the Air Max 1 blends timeless design with cushioned comfort. Sporting a fast-paced look, wavy mudguard and Nike Air, this classic icon hit the scene in ‘87 and continues to be the soul of the franchise today.",
  list_price: 140,
  sale_price: nil,
  article_number: "FD9082-106",
  division: "Men",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Zoom Vomero 5",
  subtitle: "Men's Shoes",
  description: "Carve a new lane for yourself in the Zoom Vomero 5—your go-to for complexity, depth and easy styling. The richly layered design includes textiles, leather, hairy suede and plastic accents that come together to make one of the coolest sneakers of the season.",
  list_price: 170,
  sale_price: nil,
  article_number: "FZ5051-121",
  division: "Men",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike P-6000",
  subtitle: "Men's Shoes",
  description: "The Nike P-6000 draws on the 2006 Nike Air Pegasus, bringing you a mash-up of iconic style that's breathable, comfortable and evocative of that early-2000s vibe.",
  list_price: 110,
  sale_price: nil,
  article_number: "CD6404-101",
  division: "Men",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Blazer Mid '77 Vintage",
  subtitle: "Men's Shoes",
  description: "In the ‘70s, Nike was the new shoe on the block. So new in fact, we were still breaking into the basketball scene and testing prototypes on the feet of our local team. Of course, the design improved over the years, but the name stuck. The Nike Blazer Mid ’77 Vintage—classic since the beginning.",
  list_price: 105,
  sale_price: nil,
  article_number: "BQ6806-100",
  division: "Men",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Air VaporMax Plus",
  subtitle: "Men's Shoes",
  description: "The Nike Air VaporMax Plus looks to the past and propels you into the future. Nodding to the 1998 Air Max Plus with its floating cage, padded upper and heel logo, it adds revolutionary VaporMax Air technology to ramp up the comfort and create a modern look.",
  list_price: 210,
  sale_price: nil,
  article_number: "924453-018",
  division: "Men",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike G.T. Cut 3",
  subtitle: "Basketball Shoes",
  description: "How can you separate your game when it’s winning time? Start by lacing up in the G.T. Cut 3. Designed to help you create space for stepback jumpers and backdoor cuts, its sticky multicourt traction helps you stop on a dime and shift gears at will. And when you're making all those game-changing plays, the newly added, ultra-responsive ZoomX foam helps keep you fresh for four quarters.",
  list_price: 190,
  sale_price: nil,
  article_number: "DV2913-101",
  division: "Men",
  category: "Shoes",
  sub_category: "Basketball"
)
Product.create!(
  name: "Nike G.T. Cut 2",
  subtitle: "Men's Basketball Shoes",
  description: "In today’s game, slow-footed slugs get sought out and exposed. Space makers stay on the floor. The G.T. Cut 2 helps you stop on a dime and accelerate back into the open lane in a low-to-the-ground design that helps minimize court contact while switching direction. We used insights from female athletes to create a shoe that helps you play quickly and with confidence—which every basketball player needs. Separate the players from the playmakers in a design that’s built on creating separation but supportive enough to help you play all day.",
  list_price: 170,
  sale_price: 144.97,
  article_number: "DJ6015-008",
  division: "Men",
  category: "Shoes",
  sub_category: "Basketball"
)
Product.create!(
  name: "Nike Precision 6",
  subtitle: "Basketball Shoes",
  description: "Create space, stop on a dime, shoot off the dribble—do it all with the Nike Precision 6. It's designed to enable quick players to shift speeds and change directions while staying in control. From the plush collar and tongue to the modified herringbone traction, the agile low-top lets you make the most of your skills while pushing the tempo of the game.",
  list_price: 80,
  sale_price: nil,
  article_number: "DD9535-103",
  division: "Men",
  category: "Shoes",
  sub_category: "Basketball"
)
Product.create!(
  name: "LeBron Witness 8",
  subtitle: "Basketball Shoes",
  description: "When you step on the floor, what kind of performance do you want to put on? Stop the show in these LeBron Witness 8’s, and let them know there are no limits to your flair and full-scale skills. This sleek and boldly sculpted shoe offers stability when exploding and soft landings when you come back to the ground, allowing kingpins like you and LeBron to bound, brake and bolt from baseline to baseline.",
  list_price: 110,
  sale_price: nil,
  article_number: "FB2239-300",
  division: "Men",
  category: "Shoes",
  sub_category: "Basketball"
)
Product.create!(
  name: "Nike G.T. Jump 2",
  subtitle: "Men's Basketball Shoes",
  description: "How high do you want to fly? Get off the ground quicker in a design that helps you hover and hold your own in the air when the action goes vertical. If you’re a shooter trying to add lift to your jumper, a skyscraper hoping to float among the stars, or a ground bound beast trying to beat your opponent to that rebound off the rim, this shoe can add an element of explosiveness to your game. The bounce is unlike anything you’ve felt before, and the landing is cushioned, helping you spring back skyward once you hit the ground.",
  list_price: 180,
  sale_price: nil,
  article_number: "DJ9431-003",
  division: "Men",
  category: "Shoes",
  sub_category: "Basketball"
)
Product.create!(
  name: "Tatum 1 'Arena Fits'",
  subtitle: "Basketball Shoes",
  description: "Game winner. Tunnel walk champ. Look good and play your best in a performance basketball shoe inspired by JT's legendary off-court style. With a stress-tested foam midsole and an uncaged Nike Zoom Air unit, you'll be getting those explosive ups on the court—and getting a 'fit off while you do it.",
  list_price: 120,
  sale_price: nil,
  article_number: "DZ3320-200",
  division: "Men",
  category: "Shoes",
  sub_category: "Basketball"
)
Product.create!(
  name: "KD16 'B.A.D.'",
  subtitle: "Basketball Shoes",
  description: "Wanda Durant is the real MVP, but KD also has to give props to his grandma, Barbara A. Davis, the one who told KD his height would be a gift. Her front porch was a sanctuary of sorts for the Durant family, a gathering place on Sundays to congregate, break bread, celebrate the good times and weather the bad. Her enduring memory lives on in this special design, featuring her favorite color, purple. Check the tongue and insole for her initials, B.A.D.",
  list_price: 160,
  sale_price: nil,
  article_number: "DV2917-500",
  division: "Men",
  category: "Shoes",
  sub_category: "Basketball"
)
Product.create!(
  name: "LeBron XXI 'Conchiolin'",
  subtitle: "Basketball Shoes",
  description: "Last time around, LeBron flipped the script on his shoe game as only the King can. The encore is even better. The LeBron XXI has a cabling system that works with Zoom Air cushioning and a light, low-to-the-ground design, giving you agile fluidity and explosiveness without excess weight. Created for your ascent and the next generation of hoopers, it’s ideal for Bron-like open-floor attacks and rising toward the rim when the game’s pace turns up. This special design is inspired by the supportive nature of the conchiolin, the binding agent that holds layers of the pearl and mother of pearl together. The leather has an iridescent luster that nods to the pearl-making process.",
  list_price: 200,
  sale_price: nil,
  article_number: "HF5841-100",
  division: "Men",
  category: "Shoes",
  sub_category: "Basketball"
)
Product.create!(
  name: "LeBron NXXT Gen AMPD IPS",
  subtitle: "Basketball Shoes",
  description: "Whether you’re a dunk contest-like leaper or a below-the-rim wonder roaming the baseline, feel fast, low to the court and assured in the LeBron NXXT Gen. We specifically tailored it to meet the demands of today’s fast-paced game, so that you can stay ahead of the opposition with your speed in all directions.",
  list_price: 170,
  sale_price: nil,
  article_number: "FZ7885-500",
  division: "Men",
  category: "Shoes",
  sub_category: "Basketball"
)
Product.create!(
  name: "Ja 1",
  subtitle: "Basketball Shoes",
  description: "Ja Morant became the superstar he is today by repeatedly sinking jumpers on crooked rims, jumping on tractor tires and dribbling through traffic cones in steamy South Carolina summers. The Ja 1 is a testament to his rise. With an Air Zoom unit, it supports bunny hops and hyper speed without sacrificing comfort, so that you can control your own destiny on the court, Ja style.",
  list_price: 140,
  sale_price: nil,
  article_number: "FV1290-100",
  division: "Men",
  category: "Shoes",
  sub_category: "Basketball"
)
Product.create!(
  name: "Nike G.T. Cut Academy",
  subtitle: "Basketball Shoes",
  description: "Whether you're playing in the gym, at the park or on your driveway, lace up in the all-new G.T. Cut Academy. Designed to help you create space for stepback jumpers, backdoor cuts and other game-changing plays, its sticky multicourt traction helps you stop on a dime and shift gears at will—wherever your next game is calling you.",
  list_price: 95,
  sale_price: nil,
  article_number: "FB2599-101",
  division: "Men",
  category: "Shoes",
  sub_category: "Basketball"
)
Product.create!(
  name: "KD16 (Team)",
  subtitle: "Basketball Shoes",
  description: "Kevin Durant is a true hooper. He'd be just as happy running pickup all afternoon as he would be dropping 40-pieces in the playoffs. When your avid appetite for the game can’t be satisfied, lace up in the KD16’s. Nike Air and Zoom Air work together to provide speed and stability for all four quarters, while the upper is lower and the overall load is lighter compared to the previous iteration. It's ideal for the hoopaholic who can’t say no to just one more game.",
  list_price: 160,
  sale_price: 136.97,
  article_number: "DZ2927-100",
  division: "Men",
  category: "Shoes",
  sub_category: "Basketball"
)
Product.create!(
  name: "Jordan True Flight",
  subtitle: "Men's Shoes",
  description: "The Jordan True Flight takes design elements from the AJ7 to create a sneaker that brings a classic performance look to streetwear. The iconic red and black color combo features premium leather structured around an internal sleeve, for a secure fit that's easy to get on and off.",
  list_price: 150,
  sale_price: nil,
  article_number: "CU4933-001",
  division: "Men",
  category: "Shoes",
  sub_category: "Basketball"
)
Product.create!(
  name: "Tatum 1 Team Bank",
  subtitle: "Basketball Shoes",
  description: "Your love for the game never fades. That's why the Tatum 1 was created with longevity in mind. Designed to carry you from the first through the fourth (and whatever OT comes up) as efficiently as possible, we stripped it down to the essentials—and made those essentials really, really good. The result is this season's lightest performance basketball shoe, with rubber only where it counts, a stress-tested foam midsole and an uncaged Nike Zoom Air unit for those explosive ups. Whatever stage of ball you're at, the Tatum 1 will keep you playing.",
  list_price: 120,
  sale_price: 90.97,
  article_number: "FB2863-100",
  division: "Men",
  category: "Shoes",
  sub_category: "Basketball"
)
Product.create!(
  name: "LeBron NXXT Gen",
  subtitle: "Basketball Shoes",
  description: "Whether you’re a dunk contest-like leaper or a below-the-rim wonder roaming the baseline, feel faster, lower to the court and assured in the LeBron NXXT Gen. We specifically tailored it to meet the demands of today’s fast-paced game, so that you can stay ahead of the opposition with your speed and force in all directions.",
  list_price: 170,
  sale_price: 127.97,
  article_number: "DR8784-301",
  division: "Men",
  category: "Shoes",
  sub_category: "Basketball"
)
Product.create!(
  name: "Nike G.T. Hustle 2",
  subtitle: "Basketball Shoes",
  description: "One step can make all the difference when it’s game point, like a sneaky successful backdoor layup that’s blocked if not for a sliver of separation, or a last-second leap at your opponent that sends their 3 clanking off the rim. We used insights from female athletes to make the G.T. Hustle 2 soft, supportive and lightweight—which every basketball player needs. Loaded with cushioning in the core and Zoom Air spring in the forefoot, this shoe helps you stay moving forward—from check-up to “that’s game.” Sprint, stop and score from end to end, focusing on dominating, not deteriorating, down the stretch.",
  list_price: 170,
  sale_price: nil,
  article_number: "DJ9405-102",
  division: "Men",
  category: "Shoes",
  sub_category: "Basketball"
)
Product.create!(
  name: "Luka 2",
  subtitle: "Basketball Shoes",
  description: "You bring the speed. We'll bring the stability. The Luka 2 is built to support your skills, with an emphasis on step-backs, side-steps and quick-stop action. A stacked midsole features firm, flexible cushioning for added responsiveness as you shift back and forth on the court. Up top, the full-foot wrapped cage design helps you stay contained whether you're faking out a defender or driving down the lane. With all that tech in a lightweight package, we've got efficiency covered. The rest is up to you.",
  list_price: 130,
  sale_price: nil,
  article_number: "DX8733-100",
  division: "Men",
  category: "Shoes",
  sub_category: "Basketball"
)
Product.create!(
  name: "Giannis Freak 5",
  subtitle: "Basketball Shoes",
  description: "Giannis’ internal engine revs from deep within, requiring a shoe that can harness his superpower abilities. Enter the Giannis Freak 5. Stacked with stunning speed for super-quick first steps, stuffed with that sort of springy cushioning that can withstand the all-game grind, his signature shoe lets you feel like the Greek Freak. Blow past your opponent en route to the rim, while sticking with quick-twitch ball-handlers when a defensive stand decides the game.",
  list_price: 140,
  sale_price: nil,
  article_number: "DX4985-004",
  division: "Men",
  category: "Shoes",
  sub_category: "Basketball"
)
Product.create!(
  name: "Giannis Immortality 3",
  subtitle: "Basketball Shoes",
  description: "How do you want your game to be remembered? Preserve your place among the greats, like Giannis, in the Giannis Immortality 3. Mindfully made for today’s high-paced, position-less game, it’s softer than the previous iteration with a specific traction pattern that’s perfect for pulling off the perfect Euro step en route to glory.",
  list_price: 90,
  sale_price: nil,
  article_number: "DZ7533-004",
  division: "Men",
  category: "Shoes",
  sub_category: "Basketball"
)
Product.create!(
  name: "Air Jordan XXXVIII Low 'Fundamental'",
  subtitle: "Basketball Shoes",
  description: "No combo is more associated with getting buckets than red, black and white. The Air Jordan XXXVIII Low 'Fundamental' features details honoring Chicago’s first championship three-peat, court-ready tech like the stabilizing X-Plate and full-length Zoom Strobel unit, and new forefoot tooling that gets the ultimate game shoe even closer to the ground. Classic look, futuristic feel.",
  list_price: 175,
  sale_price: nil,
  article_number: "FD2326-101",
  division: "Men",
  category: "Shoes",
  sub_category: "Basketball"
)
Product.create!(
  name: "Nike InfinityRN 4",
  subtitle: "Men's Road Running Shoes",
  description: "With supportive cushioning built for a smooth run, the Nike InfinityRN 4 is a brand-new take on a familiar favorite. It's made from our all-new Nike ReactX foam, which gives you 13% more energy return compared with Nike React foam, to help you stay fresh and bouncy. (What's more? Nike ReactX reduces its carbon footprint in a pair of midsoles by at least 43% compared to Nike React foam.*) We coupled the ReactX foam with Nike Running's best-fitting Flyknit yet, so you can take off anytime, anywhere with secure upper support and breathability. It’s the kind of shoe that can grant you that priceless peace of mind to go faster and farther thanks to an intuitive design that supports every stride. *The carbon footprint of ReactX is based on cradle-to-gate assessment reviewed by PRé Sustainability B.V and Intertek China. Other midsole components such as airbags, plates or other foam formulations were not considered.",
  list_price: 160,
  sale_price: nil,
  article_number: "DR2665-009",
  division: "Men",
  category: "Shoes",
  sub_category: "Running"
)
Product.create!(
  name: "Nike Juniper Trail 2 GORE-TEX",
  subtitle: "Men's Waterproof Trail Running Shoes",
  description: "The Juniper Trail 2 has waterproof GORE-TEX on the upper, grippy traction and a soft, cushiony midsole. It helps keep your toes dry when the trail conditions are splashy and sleety.",
  list_price: 130,
  sale_price: nil,
  article_number: "FB2067-006",
  division: "Men",
  category: "Shoes",
  sub_category: "Running"
)
Product.create!(
  name: "Nike Juniper Trail 2",
  subtitle: "Men's Trail Running Shoes",
  description: "Break away from the norm and dash up that tempting trail in the Nike Juniper Trail 2. Durable material on top and tough traction on the bottom give you a consistent, confident ride for those off-road runs calling your name. It's built for earthy terrain and unbeaten paths, with reliable traction that'll help keep you on course.",
  list_price: 90,
  sale_price: nil,
  article_number: "DM0822-102",
  division: "Men",
  category: "Shoes",
  sub_category: "Running"
)
Product.create!(
  name: "Nike Pegasus Trail 4",
  subtitle: "Men's Trail Running Shoes",
  description: "Running is your daily ritual, taking you from road to trail as you seek out new adventures and goals. Let the Nike Pegasus Trail 4 take you there and back again with its supportive and springy feel. Underfoot traction keeps you going over rocky terrain, while still providing a smooth ride for the road. Midfoot support is controlled by the laces, letting you find the right fit and feel. Your trusted workhorse with wings is ready for an off-road journey. Time to fly.",
  list_price: 140,
  sale_price: nil,
  article_number: "DJ6158-007",
  division: "Men",
  category: "Shoes",
  sub_category: "Running"
)
Product.create!(
  name: "Nike Streakfly",
  subtitle: "Road Racing Shoes",
  description: "Our lightest racing shoe, the Nike Streakfly is all about the speed you need to take on the competition in a mile, 5k or 10k race. Low profile with sleek details, it feels like it disappears on your foot to help you better connect with the road on the way to your personal best.",
  list_price: 170,
  sale_price: nil,
  article_number: "DJ6566-001",
  division: "Men",
  category: "Shoes",
  sub_category: "Running"
)
Product.create!(
  name: "Nike Motiva",
  subtitle: "Men's Walking Shoes",
  description: "The Nike Motiva helps you step through whatever the day brings, at your pace. Its uniquely patterned outsole and exaggerated rocker combine to give you a super-smooth, cushioned and comfortable ride. This means you can walk, jog or run comfortably and come back for your next leisurely stroll confidently. It gives you optimal support for your every move, every day.",
  list_price: 110,
  sale_price: nil,
  article_number: "DV1237-402",
  division: "Men",
  category: "Shoes",
  sub_category: "Running"
)
Product.create!(
  name: "Nike Flex Experience Run 12",
  subtitle: "Men's Road Running Shoes",
  description: "Stay steady and keep progressing toward your running goals in the Flex Experience 12. Minimal with full range of motion from heel to toe, it’s made to move with every stride, pace and kick when you find your groove.",
  list_price: 75,
  sale_price: nil,
  article_number: "DV0740-400",
  division: "Men",
  category: "Shoes",
  sub_category: "Running"
)
Product.create!(
  name: "Nike Winflo 9 Shield",
  subtitle: "Men's Weatherized Road Running Shoes",
  description: "Nasty weather doesn’t need to put an end to your run. Revel in the elements with these shoes designed to help you push through every puddle, pit stop, pothole and personal record. A water-repellent finish helps keep you dry while tire-like traction and a full-length Air unit provide grip and soft cushioning to help keep you running when conditions get slick.",
  list_price: 115,
  sale_price: nil,
  article_number: "DM1106-007",
  division: "Men",
  category: "Shoes",
  sub_category: "Running"
)
Product.create!(
  name: "Nike Free RN NN",
  subtitle: "Men's Road Running Shoes",
  description: "If it’s freedom you crave, this road runner can help turn you loose. Feathery and flexible, its barefoot feel and Flyknit upper will have you freewheeling with joy, ready to go a few more strides.",
  list_price: 110,
  sale_price: nil,
  article_number: "FB1276-002",
  division: "Men",
  category: "Shoes",
  sub_category: "Running"
)
Product.create!(
  name: "Nike React Phantom Run Flyknit 2",
  subtitle: "Men's Road Running Shoes",
  description: "Go the distance with cushy confidence in every step. Building on the foundation of its predecessor, this shoe expands on its laceless design by adding secure support that feels like it disappears on your foot. More foam means better cushioning, helping keep you comfortable as you run.",
  list_price: 150,
  sale_price: nil,
  article_number: "DV2139-100",
  division: "Men",
  category: "Shoes",
  sub_category: "Running"
)
Product.create!(
  name: "Nike Alphafly 2",
  subtitle: "Men's Road Racing Shoes",
  description: "Look fast, feel fast in this ultrabright edition of the Nike Air Zoom Alphafly NEXT% 2. These rocket ships are made to help shave precious time off your personal records without surrendering the foundation you need to go the full distance. A thick, lightweight support system marries the 2 worlds of comfort and speed in holy running matrimony. Enjoy the greatest energy return of all our racing shoes while you chase your personal bests.",
  list_price: 295,
  sale_price: nil,
  article_number: "FQ8110-331",
  division: "Men",
  category: "Shoes",
  sub_category: "Running"
)
Product.create!(
  name: "Nike Structure 25",
  subtitle: "Men's Road Running Shoes",
  description: "With stability where you need it, cushion where you want it, the Structure 25 supports you for long miles, short training runs and even a down-and-back before the day ends. It’s the stability you seek, loyal from the first tie-up, tried and trusted, with a midfoot system that’s fully supportive and more comfortable cushioning than before.",
  list_price: 140,
  sale_price: nil,
  article_number: "DJ7883-103",
  division: "Men",
  category: "Shoes",
  sub_category: "Running"
)
Product.create!(
  name: "Nike Vomero 17",
  subtitle: "Men's Road Running Shoes",
  description: "A springy and soft ride to energize every mile, the Vomero 17 takes you to your running happy place. Its stacked foam provides premium responsiveness to help you kick it up a notch when you’re ready for that extra gear. And with across-the-board enhancements that deliver a new level of lightweight comfort and breathability, this shoe is for those road runners who seek the thrill of the vroom and the kind of plush feel that puts you in cruise control for short-to-long distances.",
  list_price: 160,
  sale_price: nil,
  article_number: "FB1309-101",
  division: "Men",
  category: "Shoes",
  sub_category: "Running"
)
Product.create!(
  name: "Nike Vaporfly 3",
  subtitle: "Men's Road Racing Shoes",
  description: "Catch ‘em if you can. The Vaporfly 3 is made for the chasers, the racers and the elevated pacers who can’t turn down the thrill of the pursuit. We reworked the leader of the super shoe pack and tuned the engine underneath for those who see speed as a gateway to more miles and more seemingly uncatchable highs. This versatile road-racing workhorse is built for all athletes chasing personal bests from a 10K to marathon. So look fast, feel fast in this bright, color-dueling edition of a legend.",
  list_price: 270,
  sale_price: nil,
  article_number: "FQ8109-331",
  division: "Men",
  category: "Shoes",
  sub_category: "Running"
)
Product.create!(
  name: "Nike Primary",
  subtitle: "Men's Dri-FIT Long-Sleeve Versatile Top",
  description: "From weekly errands to workout classes to impromptu meetups with friends, life is a balance. Stay active and do it all with the Primary Top. Soft knit fabric (with eyelets for ventilation) helps you feel fresh all day. Nike Dri-FIT technology moves sweat away from your skin for quicker evaporation, helping you stay dry and comfortable.",
  list_price: 60,
  sale_price: nil,
  article_number: "FB8585-402",
  division: "Men",
  category: "Clothing",
  sub_category: "Tops"
)
Product.create!(
  name: "Nike Sportswear Tech Pack",
  subtitle: "Men's Long-Sleeve Sweater",
  description: "Made with premium yarns for a smooth texture and luxe finish, this engineered knit sweater from our Tech Pack collection instantly elevates your outfit. The oversized fit is designed to give you plenty of extra space to move freely and layer how you like. A cinch cord at the hem lets you decide how you want to wear it. The allover gradient pattern created by the knit hole openings adds a rich texture and finish.",
  list_price: 150,
  sale_price: nil,
  article_number: "FN2612-402",
  division: "Men",
  category: "Clothing",
  sub_category: "Tops"
)
Product.create!(
  name: "Jordan Flight Essentials",
  subtitle: "Men's Oversized T-Shirt",
  description: "Designed with an intentionally oversized fit, this tee is ready for whatever the day brings. With a Jumpman woven patch on the chest, no one will question what you're about.",
  list_price: 48,
  sale_price: nil,
  article_number: "DZ7313-133",
  division: "Men",
  category: "Clothing",
  sub_category: "Tops"
)
Product.create!(
  name: "Jordan Flight Essentials",
  subtitle: "Men's Oversized T-Shirt",
  description: "Big 'n' baggy for comfort and style. This super soft tee features longer sleeves and dropped shoulders. Combined with a minimal Jumpman woven chest patch, you're lookin' n-i-c-e.",
  list_price: 48,
  sale_price: nil,
  article_number: "DZ0604-604",
  division: "Men",
  category: "Clothing",
  sub_category: "Tops"
)
Product.create!(
  name: "Jordan Flight Essentials",
  subtitle: "Men's T-Shirt",
  description: "Count 'em. Watercolor-inspired graphics rep MJ's six championships on this relaxed cotton tee.",
  list_price: 38,
  sale_price: nil,
  article_number: "FN5966-436",
  division: "Men",
  category: "Clothing",
  sub_category: "Tops"
)
Product.create!(
  name: "Jordan Brand",
  subtitle: "Men's T-Shirt",
  description: "The only thing that could make a classic tee better? A classic sneaker. Made of 100% cotton, this relaxed tee features a small embroidered AJ1 patch for a subtle hit of cool.",
  list_price: 52,
  sale_price: nil,
  article_number: "FN5982-091",
  division: "Men",
  category: "Clothing",
  sub_category: "Tops"
)
Product.create!(
  name: "Nike",
  subtitle: "Men's Fitness T-Shirt",
  description: "Made with a relaxed fit and soft, midweight cotton, this Nike tee honors the legendary Bo Jackson with workout graphics inspired by his beloved tees of the past.",
  list_price: 40,
  sale_price: nil,
  article_number: "FQ3899-480",
  division: "Men",
  category: "Clothing",
  sub_category: "Tops"
)
Product.create!(
  name: "Nike Dri-FIT",
  subtitle: "Men's Fitness T-Shirt",
  description: "The Nike Dri-FIT T-Shirt delivers a soft feel, sweat-wicking performance and a great range of motion to get you through your workout in total comfort.",
  list_price: 30,
  sale_price: nil,
  article_number: "AR6029-222",
  division: "Men",
  category: "Clothing",
  sub_category: "Tops"
)
Product.create!(
  name: "Nike Sportswear Club",
  subtitle: "Men's T-Shirt",
  description: "The Nike Sportswear Club T-Shirt is made with our everyday cotton fabric and a classic fit for a familiar feel right out of the bag. An embroidered Futura logo on the chest provides a signature Nike look.",
  list_price: 30,
  sale_price: nil,
  article_number: "AR4997-480",
  division: "Men",
  category: "Clothing",
  sub_category: "Tops"
)
Product.create!(
  name: "Nike Sportswear Club",
  subtitle: "Men's Long-Sleeve T-Shirt",
  description: "The Nike Sportswear T-Shirt sets you up with a soft cotton jersey feel and Nike's signature logo embroidered on the chest.",
  list_price: 35,
  sale_price: nil,
  article_number: "AR5193-365",
  division: "Men",
  category: "Clothing",
  sub_category: "Tops"
)
Product.create!(
  name: "Nike ACG 'Cruise Boat'",
  subtitle: "Men's Dri-FIT T-Shirt",
  description: "Inspired by scenic whitewater adventures along the White Salmon River in Washington, USA, this roomy ACG tee celebrates the joy of cruising through the rapids.",
  list_price: 55,
  sale_price: nil,
  article_number: "FQ3725-809",
  division: "Men",
  category: "Clothing",
  sub_category: "Tops"
)
Product.create!(
  name: "Nike ACG",
  subtitle: "Men's Dri-FIT T-Shirt",
  description: "Get out there and sweat in this Nike ACG tee. The roomy cut and heavyweight fabric offer a premium feel, which, with the help of our sweat-wicking tech, helps keep you feeling dry and fresh.",
  list_price: 50,
  sale_price: nil,
  article_number: "FQ3740-361",
  division: "Men",
  category: "Clothing",
  sub_category: "Tops"
)
Product.create!(
  name: "Nike Dri-FIT Legend",
  subtitle: "Men's Fitness T-Shirt",
  description: "Updating the Legend T-shirt, this sweat-wicking tee is soft in all the right ways. We also cut it with a more relaxed, looser fit than previous versions so you can move through your reps without missing a beat.",
  list_price: 30,
  sale_price: nil,
  article_number: "DX0989-402",
  division: "Men",
  category: "Clothing",
  sub_category: "Tops"
)
Product.create!(
  name: "Nike Dri-FIT Legend",
  subtitle: "Men's Long-Sleeve Fitness Top",
  description: "A sweat-wicking legend returns with an updated look and feel. It's soft in all the right ways, with a more relaxed, looser fit than previous versions so you can move through your reps without missing a beat.",
  list_price: 35,
  sale_price: nil,
  article_number: "DX0993-638",
  division: "Men",
  category: "Clothing",
  sub_category: "Tops"
)
Product.create!(
  name: "Nike Tour",
  subtitle: "Men's Dri-FIT Golf Polo",
  description: "Focus on what matters, and never worry about what to wear with the Nike Tour Polo. Stretchy, sweat-wicking fabric with an odor-resistant finish helps you stay fresh for 18 holes. It's extra breathable around the collar for cooling comfort. The length gives you the option to wear the polo tucked or untucked.",
  list_price: 80,
  sale_price: nil,
  article_number: "FD5735-423",
  division: "Men",
  category: "Clothing",
  sub_category: "Tops"
)
Product.create!(
  name: "Nike Tour",
  subtitle: "Men's Dri-FIT Golf Polo",
  description: "Focus on what matters, and never worry about what to wear with this Nike Tour Polo. Stretchy, sweat-wicking fabric helps you stay fresh for 18 holes. It's extra breathable around the collar for cooling comfort. The length gives you the option to wear the polo tucked or untucked.",
  list_price: 80,
  sale_price: nil,
  article_number: "FD5935-451",
  division: "Men",
  category: "Clothing",
  sub_category: "Tops"
)
Product.create!(
  name: "Nike Victory",
  subtitle: "Men's Dri-FIT Golf Polo",
  description: "Feel your best whenever you hit the course with our relaxed fit Victory polo. This classic golf staple is crafted with stretchy, breathable fabric that helps keep the sweat off. Inspired by the flight path and velocity of your shot, the ripple effect reimagines the traditional stripes on your favorite golf top.",
  list_price: 68,
  sale_price: nil,
  article_number: "FD5829-065",
  division: "Men",
  category: "Clothing",
  sub_category: "Tops"
)
Product.create!(
  name: "Nike Club",
  subtitle: "Men's Cargo Pants",
  description: "When your daily adventures call for lightweight, breathable comfort, pull on a pair of these cotton ripstop pants from our Nike Club collection. Cargo pockets offer plenty of storage while the relaxed straight-leg fit gives you a casual feel through the seat and thighs for easy, everyday wear.",
  list_price: 95,
  sale_price: nil,
  article_number: "FZ5765-281",
  division: "Men",
  category: "Clothing",
  sub_category: "Bottoms"
)
Product.create!(
  name: "Nike Club",
  subtitle: "Men's Knit Joggers",
  description: "East to style and comfortable to wear, our Nike Club knit joggers are ready to become a versatile piece of your casual wardrobe. The relaxed fit is designed to give you a bit of room through the seat and thighs. The slight taper and ribbed ankle cuffs keep it clean around your sneakers. Pull them on with a tee or your favorite hoodie for casual, everyday wear.",
  list_price: 55,
  sale_price: nil,
  article_number: "FQ4330-410",
  division: "Men",
  category: "Clothing",
  sub_category: "Bottoms"
)
Product.create!(
  name: "Nike Sportswear Club",
  subtitle: "Men's Knit Open-Hem Pants",
  description: "Lightweight and comfy, these open-hem knit pants are a soft, daily essential. The relaxed, straight-leg fit gives you some room through the seat and thighs, while the elastic waist and outer drawcord let you cinch up the right fit. Pull them on with a hoodie or tee for casual lounging or getting around town in comfort.",
  list_price: 55,
  sale_price: nil,
  article_number: "FQ4332-657",
  division: "Men",
  category: "Clothing",
  sub_category: "Bottoms"
)
Product.create!(
  name: "Jordan Essentials",
  subtitle: "Men's Fleece Pants",
  description: "Who doesn't need a sick pair of sweats for whatever the day throws your way? These are made of classic soft fleece, with graphics inspired by MJ's championship days.",
  list_price: 88,
  sale_price: nil,
  article_number: "FN4619-231",
  division: "Men",
  category: "Clothing",
  sub_category: "Bottoms"
)
Product.create!(
  name: "Jordan Brooklyn Fleece",
  subtitle: "Men's Sweatpants",
  description: "You want sweats that are simple and look good, right? Here you go. They're made of soft fleece that's smooth on the outside and plush on the inside, helping you stay comfy and warm all day.",
  list_price: 72,
  sale_price: nil,
  article_number: "FJ7779-687",
  division: "Men",
  category: "Clothing",
  sub_category: "Bottoms"
)
Product.create!(
  name: "Jordan Wordmark",
  subtitle: "Men's Fleece Pants",
  description: "Just 'cause they're sweats doesn't mean they can't be luxe. High-quality, heavyweight fleece—smooth on the outside, and plush on the inside—keeps you feeling nice. The minimal style wont detract attention from you, or your kicks.",
  list_price: 110,
  sale_price: nil,
  article_number: "FJ0696-045",
  division: "Men",
  category: "Clothing",
  sub_category: "Bottoms"
)
Product.create!(
  name: "Jordan Essentials",
  subtitle: "Men's Woven Pants",
  description: "School, work, whatever—these are pants for everywhere you go. Center seams and an extra cargo pocket give you a look with just enough distinction. And the woven material is lightweight and airy so you can wear 'em all day, no problem.",
  list_price: 75,
  sale_price: nil,
  article_number: "FN4539-231",
  division: "Men",
  category: "Clothing",
  sub_category: "Bottoms"
)
Product.create!(
  name: "LeBron",
  subtitle: "Men's Open Hem Fleece Pants",
  description: "LeBron pushes the boundaries, whether it's his personal style or his dominance on the hardwood. These brushed fleece pants have a relaxed fit and slightly cropped design—perfect for showing off your sneakers—to push your look forward like LeBron. Adjustable drawcords at the hem let you customize your fit and the brushed fleece provides warm comfort. Coronated by LeBron's lion logo and crown graphics, these stamps are made only for the kings and queens of the hardwood.",
  list_price: 95,
  sale_price: nil,
  article_number: "FB7127-027",
  division: "Men",
  category: "Clothing",
  sub_category: "Bottoms"
)
Product.create!(
  name: "Ja Standard Issue",
  subtitle: "Men's Dri-FIT Jogger Basketball Pants",
  description: "Ja Morant is a self-made superstar. Away from the spotlight, Ja grew up tirelessly working on his game on his backyard court in South Carolina. From anonymous to All-Star, Nike celebrates the journey with his signature apparel collection. Nike Dri-FIT technology moves sweat away from your skin for quicker evaporation, helping you stay dry and comfortable. Ja's logo and graphics give our soft, relaxed-fit Standard Issue pants a signature finish.",
  list_price: 95,
  sale_price: nil,
  article_number: "FN2994-410",
  division: "Men",
  category: "Clothing",
  sub_category: "Bottoms"
)
Product.create!(
  name: "Nike Standard Issue",
  subtitle: "Men's Dri-FIT Basketball Pants",
  description: "The Nike Standard Issue collection is designed to meet the performance needs of today's athlete while channeling the throwback energy of vintage gear. These sweat-wicking, midweight knit pants can be worn on and off the court, plus have a loose and roomy feel (like gear from back in the day). Graphics pay tribute to the gritty culture of outdoor hoops.",
  list_price: 95,
  sale_price: nil,
  article_number: "FN2696-012",
  division: "Men",
  category: "Clothing",
  sub_category: "Bottoms"
)
Product.create!(
  name: "Nike Standard Issue",
  subtitle: "Men's Dri-FIT Basketball Pants",
  description: "Nike Basketball offers the Standard Issue Pants, part of a collection that combines the look of vintage sportswear with a modern performance feel. They're made from soft, sweat-wicking French terry fabric with a relaxed fit.",
  list_price: 90,
  sale_price: nil,
  article_number: "CK6365-412",
  division: "Men",
  category: "Clothing",
  sub_category: "Bottoms"
)
Product.create!(
  name: "Nike ACG Polartec® 'Wolf Tree'",
  subtitle: "Men's Pants",
  description: "Wet weather doesn't mean you have to stop exploring. Stay warm in our design inspired by Oregon's Smith Rock. Remarkably soft fabric, made with 100% recycled polyester fibers, helps you stay warm when temperatures begin to drop. Zippered storage keeps your essentials close.",
  list_price: 160,
  sale_price: nil,
  article_number: "CV0658-011",
  division: "Men",
  category: "Clothing",
  sub_category: "Bottoms"
)
Product.create!(
  name: "Nike ACG 'Smith Summit'",
  subtitle: "Men's Cargo Pants",
  description: "We looked to Smith Rock to inspire us and came back with the light and durable Nike ACG 'Smith Summit' Cargo Pants. They've got a loose feel and zip-off design that lets you convert them into shorts when the weather gets too hot. Plenty of pockets keep your gear close, while an included carabiner lets you latch your keys.",
  list_price: 195,
  sale_price: nil,
  article_number: "FN0428-247",
  division: "Men",
  category: "Clothing",
  sub_category: "Bottoms"
)
Product.create!(
  name: "Nike Life",
  subtitle: "Men's Fatigue Pants",
  description: "Built for life and made to last, these fatigue pants are part of our Nike Life collection. The roomy fit gives you space through the seat, thighs and legs, while soft herringbone twill keeps your look casual and timeless. Rectangular patch pockets on the front with button-down pockets on the back complete the military-inspired design.",
  list_price: 130,
  sale_price: nil,
  article_number: "FV5533-222",
  division: "Men",
  category: "Clothing",
  sub_category: "Bottoms"
)
Product.create!(
  name: "Nike SB Kearny",
  subtitle: "Men's Cargo Skate Pants",
  description: "Made from durable ripstop fabric in a roomy, skate-ready fit, these Nike SB pants are built to last. The classic cargo design doesn't skimp on storage. With 6 pockets and a fake care label stash pocket, you'll have plenty of places to keep your essentials secure on and off your board.",
  list_price: 100,
  sale_price: nil,
  article_number: "FQ0495-281",
  division: "Men",
  category: "Clothing",
  sub_category: "Bottoms"
)
Product.create!(
  name: "Nike Dunk Low",
  subtitle: "Women's Shoes",
  description: "Created for the hardwood but taken to the streets, the '80s b-ball icon returns with perfectly shined overlays and classic team colors. With its iconic hoops design, the Nike Dunk Low channels '80s vintage back onto the streets while its padded, low-cut collar lets you take your game anywhere—in comfort.",
  list_price: 115,
  sale_price: nil,
  article_number: "DD1503-101",
  division: "Women",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Blazer Low Platform",
  subtitle: "Women's Shoes",
  description: "Praised for its classic simplicity and comfort, the Nike Blazer Low Platform elevates the hoops icon. The lifted midsole/outsole lets you step confidently while the upper keeps the proportions you loved from the original.",
  list_price: 100,
  sale_price: nil,
  article_number: "DJ0292-101",
  division: "Women",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Blazer Low '77",
  subtitle: "Women's Shoes",
  description: "Praised by the streets for its simplicity and comfort, the Blazer returns with its classic hoops style. Featuring crisp leather, low-cut collar and an exposed tongue, it's a must-have wardrobe staple.",
  list_price: 90,
  sale_price: nil,
  article_number: "DC4769-102",
  division: "Women",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Air Force 1 ’07",
  subtitle: "Women's Shoes",
  description: "Take your love for the game with you wherever you go. Crossing hardwood comfort with off-court flair, these kicks put a fresh spin on a hoops classic with muted neutrals against a backdrop of rich materials. Of course, we kept the same era-echoing '80s construction and a hidden Nike Air unit you know and love for that legendary AF1 feel. Go ahead, slip into a slam dunk.",
  list_price: 115,
  sale_price: nil,
  article_number: "FZ3597-133",
  division: "Women",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Phoenix Waffle",
  subtitle: "Women's Shoes",
  description: "All-day comfort meets all-day style. Taking cues from original Blue Ribbon Sports designs and incorporating the technological advances of today, the Phoenix Waffle rises from the ashes. A redesigned Waffle tread lightens the shoe, while the increased midsole height creates an even softer ride. Check the vintage Swoosh logo and archive-inspired tongue for a modern take on classic BRS looks.",
  list_price: 100,
  sale_price: nil,
  article_number: "FD2196-100",
  division: "Women",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Air Force 1 Wild",
  subtitle: "Women's Shoes",
  description: "The outdoors is for everyone—and this shoe is too. The classic AF1 gets an adventurous refresh with utility lacing, durable materials and sturdy stitching. The textile-wrapped midsole is light and more flexible, while an added heel pillow creates extra comfort. Embroidered accents contrast with boot-like details for a look that's versatile and functional.",
  list_price: 145,
  sale_price: nil,
  article_number: "FB2348-003",
  division: "Women",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Court Vision Low Next Nature",
  subtitle: "Women's Shoes",
  description: "In love with the classic look of '80s basketball but have a thing for the fast-paced culture of today's game? Meet the Nike Court Vision Low Next Nature. Made from at least 20% recycled materials by weight, its crisp upper and stitched overlays are inspired by the days of hook-shots and tube socks. The padded collar and rubber outsole bring comfort and traction for your world.",
  list_price: 80,
  sale_price: nil,
  article_number: "DH3158-109",
  division: "Women",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Air Max Correlate",
  subtitle: "Women's Shoes",
  description: "The Nike Air Max Correlate sets you up in throwback style with a multi-textured upper and Max Air unit. Its soft foam midsole and breathable upper offer all-day comfort wherever your day takes you.",
  list_price: 100,
  sale_price: nil,
  article_number: "511417-136",
  division: "Women",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Court Vision Alta",
  subtitle: "Women's Shoes",
  description: "Street fashion meets b-ball authenticity in the distinctly modern and 100% feminine Nike Court Vision Alta. The detailed upper features a collapsable heel for style versatility, chic synthetic leather with tumbled texture and transparent mesh for an airy aesthetic. Its lifted foam midsole feels incredible while keeping the heritage b-ball look.",
  list_price: 85,
  sale_price: 68.97,
  article_number: "CW6536-600",
  division: "Women",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Dunk Low",
  subtitle: "Women's Shoes",
  description: "Created for the hardwood but taken to the streets, the '80s b-ball icon returns with perfectly shined overlays and classic team colors. With its iconic hoops design, the Nike Dunk Low channels '80s vintage back onto the streets while its padded, low-cut collar lets you take your game anywhere—in comfort.",
  list_price: 115,
  sale_price: nil,
  article_number: "DD1503-118",
  division: "Women",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike M2K Tekno",
  subtitle: "Shoes",
  description: "The Nike M2K Tekno Shoe draws inspiration from the Monarch franchise and pushes it into today with a futuristic heel counter and plush tongue for additional comfort.",
  list_price: 120,
  sale_price: nil,
  article_number: "BQ3378-100",
  division: "Women",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Air Jordan 1 Low SE",
  subtitle: "Women's Shoes",
  description: "You're fearless. It's in your DNA. Celebrate what defines you with the AJ1. Inspired by the 1985 original, this pair offers a clean, classic look that's familiar yet always fresh. With chain-stitched details and an embroidered Wings logo on the heel, these J's are a perfect example of what makes Jordan Brand so special.",
  list_price: 125,
  sale_price: nil,
  article_number: "FV3623-151",
  division: "Women",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Air Jordan 1 Elevate Low",
  subtitle: "Women's Shoes",
  description: "Rise to the occasion in style that soars. This shoe reworks an icon's original magic with a platform sole and low cut silhouette. Air cushioning keeps you lifted, and sleek leather in contrasting colors adds visual interest.",
  list_price: 135,
  sale_price: 81.97,
  article_number: "DH7004-400",
  division: "Women",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Air Jordan 1 Low SE",
  subtitle: "Women's Shoes",
  description: "Low-top, but never low profile. This special edition AJ1 Low brings rich textures and warm neutrals together for a look that can carry or complement your freshest 'fit.",
  list_price: 125,
  sale_price: nil,
  article_number: "FJ3453-200",
  division: "Women",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Air Max Thea",
  subtitle: "Women's Shoes",
  description: "The Air Max Thea is equipped with breathable mesh, lightweight cushioning and a sleek profile for lasting comfort and understated style.",
  list_price: 120,
  sale_price: 72.97,
  article_number: "FJ9302-104",
  division: "Women",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Air Force 1 '07",
  subtitle: "Women's Shoes",
  description: "The radiance lives on in the Nike Air Force 1 '07. Metallic studded Swoosh logos add a touch of reinforced shine to this hoops original, while everything you know best about the AF1 is still there: classic leather, durable construction and full-length Air cushioning.",
  list_price: 125,
  sale_price: 106.97,
  article_number: "FQ8887-100",
  division: "Women",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Calm",
  subtitle: "Men's Mules",
  description: "Enjoy a calm, comfortable experience—no matter where your day off takes you. Made with soft yet responsive foam, these lightweight mules are easy to style and easy to pack. While the water-friendly design makes them ideal for the beach or pool, the minimalist look is elevated enough to wear around in the city. Plus, a removable heel strap adjusts for the perfect fit. Time to slide in and check out.",
  list_price: 60,
  sale_price: nil,
  article_number: "FD5130-200",
  division: "Women",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Dunk High 1985",
  subtitle: "Shoes",
  description: "Celebrate heritage with an updated version of the Dunk High, recrafted to reflect the original from 1985. Matching the shape, look and feel that started it all, it delivers true vintage style while keeping the familiar comfort you love.",
  list_price: 140,
  sale_price: 77.97,
  article_number: "DV1143-800",
  division: "Women",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Dunk Low Next Nature",
  subtitle: "Women's Shoes",
  description: "With a tropical palette and rich texture, an allover floral print adds dimension to this sneaker icon. Jacquard knit pairs with classic details and throwback hoops flair, while a padded, low-cut collar lets you take your game anywhere—in comfort.",
  list_price: 110,
  sale_price: nil,
  article_number: "FN7105-030",
  division: "Women",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Air Jordan 1 Elevate High",
  subtitle: "Women's Shoes",
  description: "Classic Jordan style reaches new heights in this lifted AJ1. The platform stance and high-top collar make a statement while crisp leather and flashy finishes make these kicks the winning assist your outfit needs. For added flex, the puffy, stitched-on Wings 'logo' delivers big (and just wait until you feel the ultra-comfortable Air cushioning underfoot). Go ahead, elevate your game.",
  list_price: 145,
  sale_price: nil,
  article_number: "DN3253-121",
  division: "Women",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Dunk Low Unlocked By You",
  subtitle: "Custom Shoes",
  description: "Cheetah and tiger and croc—oh my! It's time to design the Dunk of your dreams. The left and right shoes can be customized independently (excluding character personalization), so let your imagination go wild. Velvet cheetah and tiger prints in a '90s-inspired color palette mix with a textural croc suede for the ultimate maximalist look. Don't forget your shoelery for the finishing touch.",
  list_price: 160,
  sale_price: nil,
  article_number: "FJ2253-901",
  division: "Women",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Blazer Low '77 Jumbo",
  subtitle: "Women's Shoes",
  description: "They say, 'Don't fix what works.' We say, 'Perfect it.' This streetwear superstar gets revamped with jumbo-sized details. Harnessing the old-school look you love, the Nike Blazer Low '77 Jumbo features an oversized Swoosh design, extra-wide laces and thicker stitching.",
  list_price: 100,
  sale_price: nil,
  article_number: "DQ1470-002",
  division: "Women",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Air Max 1 '87 By You",
  subtitle: "Custom Shoes",
  description: "The classic Air Max gets refreshed with a premium look for you, by you. Choose between nubuck leather, smooth leather and a polished croc that reveals another color with wear. Then, line your shoe with traditional mesh or go luxe with velvet. Add a jeweled or classic Swoosh logo and choose between gold or silver shoelery that doubles as a bracelet. And don't forget to add some color to your Nike Air unit, midsole and outsole.",
  list_price: 180,
  sale_price: nil,
  article_number: "FJ8893-900",
  division: "Women",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Air Max 95 Unlocked By You",
  subtitle: "Custom Women's Shoes",
  description: "Inspire the streets with your Air Max 95. The customizable design (with a coveted woven upper) lets you bring your own aesthetic to the legendary look by selecting your fave colors and choice materials. Add a personalized message that lets you tell a piece of your story. Boost the energy with colored Air units or by making your design monochromatic. Then, add the cherry to the bottom and ramp up the comfort by selecting an ultra-cushy sockliner.",
  list_price: 215,
  sale_price: nil,
  article_number: "DX5388-900",
  division: "Women",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Air Jordan 1 Mid SE Craft",
  subtitle: "Men's Shoes",
  description: "New colors and fresh textures give you an artisanal AJ1 that keeps the look classic and the feel familiar. This all-time favorite is made of premium materials and decked out with raw edges and contrasting stitching.",
  list_price: 135,
  sale_price: 101.97,
  article_number: "FD6817-003",
  division: "Women",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Air More Uptempo",
  subtitle: "Men's Slides",
  description: "Keeping the exaggerated, graffiti-styled 'AIR' graphics and full-length Nike Air cushioning you love from the original, your favorite hoops look gets transformed into an easy on/easy off slide. Pairing '90s style with summertime comfort, its plush strap, airy perforations and soft foam make it a perfect choice—courtside, beachside and anywhere in between.",
  list_price: 85,
  sale_price: nil,
  article_number: "FJ2708-001",
  division: "Women",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Air Jordan 1 Mid SE",
  subtitle: "Men's Shoes",
  description: "Rock some retro colors and look good doin' it. This pair of kicks has nubuck leather and suede in the upper for a plush look and feel. Nike Air in the sole keeps your every step light as&…well, air.",
  list_price: 135,
  sale_price: nil,
  article_number: "FJ4923-008",
  division: "Women",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Court Royale 2",
  subtitle: "Women's Shoe",
  description: "A flash from the past, the Nike Court Royale 2 features the same design that has rocked the streets since the late '70s. Suede on the upper feels soft and is easy to wear, while the large retro Swoosh adds throwback appeal. To top it off, the modernized herringbone sole puts a modern twist on the classic look.",
  list_price: 65,
  sale_price: nil,
  article_number: "CZ0218-001",
  division: "Women",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Victori One",
  subtitle: "Women's Slides",
  description: "From the beach to gardening to sitting on the couch, the Nike Victori One perfects a classic design. Delivering lightweight comfort that’s easy to wear, it features new softer, more responsive foam. The contoured grip pattern helps cradle and hold your foot in place.",
  list_price: 35,
  sale_price: nil,
  article_number: "CN9677-002",
  division: "Women",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Cortez 23 Premium",
  subtitle: "Women's Shoes",
  description: "An icon for over 50 years. This refreshed design includes a wider toe area and firmer side panels so you can comfortably wear them day in, day out without any warping. Original Cortez design lines give a heritage feel.",
  list_price: 110,
  sale_price: 82.97,
  article_number: "FB6877-001",
  division: "Women",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Air Max 97",
  subtitle: "Women's Shoes",
  description: "Push your style full speed ahead with the Air Max 97. Its iconic design takes inspiration from water droplets and Japanese bullet trains. Full-length Nike Air cushioning lets you ride in performance comfort. Lace up and ride first class.",
  list_price: 190,
  sale_price: 111.97,
  article_number: "DQ9131-700",
  division: "Women",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Waffle One Exeter Edition",
  subtitle: "Women's Shoes",
  description: "The Nike Waffle One Exeter Edition nods to a Nike pioneer's ingenuity and craftsmanship. Jeff Johnson arrived to Exeter, New Hampshire, in 1974 with 1 goal: to help a fledgling shoe company find an edge within a vanishing local manufacturing industry. From here he took a scrappy approach that resulted in collecting excess waste materials from local vendors to create shoes in colors and material combos never before seen. While remaining true to its OG running roots, these shoes get revamped with features like excess materials in the upper and about 10% Nike Grind materials in the outsole and 60% recycled materials in the heel clip. They're audacious. They're thoughtful. They're game-changers.",
  list_price: 100,
  sale_price: 89.97,
  article_number: "DM8114-800",
  division: "Women",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Go FlyEase",
  subtitle: "Easy On/Off Shoes",
  description: "Ditch the laces and get outside. These kicks feature Nike's revolutionary FlyEase technology, making on-and-off a breeze. With a heel that pivots open for a totally hands-free entry, they're great for people with limited mobility—or anyone who wants a quicker way to get going.",
  list_price: 125,
  sale_price: nil,
  article_number: "DR5540-002",
  division: "Women",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Air Max Pre-Day",
  subtitle: "Women's Shoes",
  description: "Taking the classic look of heritage Nike running into a new realm, the Nike Air Max Pre-Day brings you a fast-paced look ready for today's world. Made from at least 20% recycled materials by weight, it mixes a variety of contrasting fabrics to create an excitingly fresh look.",
  list_price: 135,
  sale_price: 121.97,
  article_number: "DM8259-002",
  division: "Women",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Spark",
  subtitle: "Women's Shoes",
  description: "Put a little spark in your step. These thoughtfully crafted kicks pair luxe comfort with extra stability—without sacrificing style. The dual foam midsole, pillowy collar and plush tongue keep you cushioned while a sleek design and textured pull tab bring energy to any 'fit.",
  list_price: 135,
  sale_price: 85.97,
  article_number: "DJ6945-200",
  division: "Women",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Air Max Plus",
  subtitle: "Women's Shoes",
  description: "Let your attitude have the edge with this tuned Nike Air experience that offers premium stability and unbelievable cushioning. Featuring classic ‘90s style, airy mesh and nature-inspired design lines, it lets you celebrate your defiant style in comfort.",
  list_price: 175,
  sale_price: 131.97,
  article_number: "DZ3671-103",
  division: "Women",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike ISPA Sense Flyknit",
  subtitle: "Men's Shoes",
  description: "Breathe in. Breathe out. The ISPA Sense is your ticket to tranquility. Mixing sustainable materials (it's made with at least 20% recycled content by weight) with meditative comfort, the design pulls inspiration from Zen gardens. The stretchy, bootie-like upper with an airy Flyknit design integrates venting and padding for extra on-foot bliss. Tie it all together with the sleek lacing system and then stay upright with added traction on the outsole. Do good, look good, and overcome the urban environment’s most challenging obstacles with this fresh design that gives new meaning to rest and relaxation.",
  list_price: 200,
  sale_price: 150.97,
  article_number: "CW3203-600",
  division: "Women",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Air Huarache Craft",
  subtitle: "Women's Shoes",
  description: "When it fits this good and looks this great, there's no question—you're leading the charge. From its stretchy, foot-hugging fabric to its sporty, supportive heel cage, the Huarache Craft remasters everything you love best about the iconic shoe. Plus, its plush foam midsole and incredibly soft upper give your feet bragging rights.",
  list_price: 130,
  sale_price: 97.97,
  article_number: "DQ8031-201",
  division: "Women",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Phoenix Waffle By You",
  subtitle: "Custom Women's Shoes",
  description: "All-day comfort meets all-day style. Taking cues from original Blue Ribbon Sports designs and incorporating the technological advances of today, the Phoenix Waffle rises from the ashes for a design unique to you. Start by choosing between 3 materials for the upper. Or maybe a combination of materials—because, why not? Then play into the heritage style with bold color blocking or go full-on monochromatic. It's time to add your personal spin to a classic BRS look.",
  list_price: 120,
  sale_price: nil,
  article_number: "FQ8789-900",
  division: "Women",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Air Jordan 1 Elevate High SE",
  subtitle: "Women's Shoes",
  description: "It might not be banned on court anymore, but the Air Jordan 1 continues to break new ground. Inspired by one of the original '85 colorways, this edition's lifted silhouette celebrates how gracefully the icon has aged over time. Think of it like the AJ1's cool younger cousin—a little taller, a little bolder, but unmistakably part of the same legendary family tree.",
  list_price: 155,
  sale_price: 116.97,
  article_number: "DZ3744-100",
  division: "Women",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Air Max Dawn",
  subtitle: "Women's Shoes",
  description: "Root yourself to sporty track DNA with this throwback design. We've included era-echoing fabrics like soft synthetic suede and synthetic leather, while modern design lines keep your look fresh. Lace up and give your day a feel-good forecast.",
  list_price: 115,
  sale_price: 80.97,
  article_number: "DX5655-500",
  division: "Women",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Air Adjust Force 2023",
  subtitle: "Women's Shoes",
  description: "Coming in hot and ready for the season, the clandestine hoops shoe you've longed to see back on the streets is finally ready to refresh your 'fit. Sleek leather and embroidered accents bring a sporty mystique, while metallic finishes and a sculpted midsole let you step into the future. Oh, and we kept the removable mid-foot strap that made this look legendary—and added another one so you can personalize your look.",
  list_price: 170,
  sale_price: 93.97,
  article_number: "DV7409-100",
  division: "Women",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike SB Zoom Blazer Low Pro GT",
  subtitle: "Skate Shoes",
  description: "Rebuilt using insights from Grant Taylor, the Nike SB Zoom Blazer Low Pro GT is a fresh take on a favorite skate shoe. The updated design has higher taping to give you more durability.",
  list_price: 85,
  sale_price: nil,
  article_number: "DC7695-003",
  division: "Women",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Air Max 2017",
  subtitle: "Women's Shoes",
  description: "The Nike Air Max 2017 SE delivers the plush sensation you love with a full-length Max Air unit. The upper is constructed with zonal support and ventilation while molded foam wraps your midfoot and heel for a secure fit.",
  list_price: 190,
  sale_price: nil,
  article_number: "849560-001",
  division: "Women",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Air More Uptempo x Serena Williams Design Crew",
  subtitle: "Shoes",
  description: "Ready to excite? Celebrating Serena's penchant for flair (specifically that on-court, denim skirt moment), this fresh take on on the coveted hoops icon flawlessly blends fashion with sport. From the raw-edged, hemp upper to the metallic lace hooks to the Swoosh, you'll be sure to awe the crowd with these denim-inspired details.",
  list_price: 180,
  sale_price: 99.97,
  article_number: "DX4219-400",
  division: "Women",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Asuna 3 Next Nature",
  subtitle: "Women's Slides",
  description: "The Asuna gets a utilitarian twist in its 3rd rendition that preserves the iconic comfort while enhancing durability. The padded strap is easily adjustable to accommodate your foot's shape and size, as well as your comfiest socks. The original side lacing system takes a step back for a minimalist strap that makes customizing your fit even simpler. These aren't your average pool slides—but you'll want to wear them there, too.",
  list_price: 45,
  sale_price: nil,
  article_number: "FB2184-002",
  division: "Women",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Run Star Hike Platform",
  subtitle: "Unisex Shoes",
  description: "Available in a low top for the first time, the Run Star Hike's chunky platform and jagged rubber sole put an unexpected twist on your everyday Chucks. Details like a canvas build, rubber toe cap and Chuck Taylor ankle patch stay true to the original, while a molded platform, two-tone outsole and rounded heel give off futuristic vibes.",
  list_price: 105,
  sale_price: nil,
  article_number: "168816C-001",
  division: "Women",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Tanjun",
  subtitle: "Women's Shoes",
  description: "Forget the hype. The Nike Tanjun brings you simplicity at its best. Made with at least 20% recycled content and 100% recycled polyester laces, no detail is overlooked on this one. Lightweight. Airy. Comfortable. These are just words. This shoe is all you need.",
  list_price: 70,
  sale_price: nil,
  article_number: "DJ6257-002",
  division: "Women",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Air Huarache Craft By You",
  subtitle: "Custom Women's Shoes",
  description: "We love a DIY craft...Huarache Craft that is. Whether you're feeling totally neon or just want a few pops of color, you can customize your Huarache from heel cage to toe tip. Synthetic suede and cushioned collar add a touch of luxury. Raw edges and recycled materials (like threads in the upper and foam in the inner sleeve) are a visual reminder of your creative spirit.",
  list_price: 160,
  sale_price: nil,
  article_number: "FB2391-900",
  division: "Women",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Icon Classic",
  subtitle: "Women's Sandals",
  description: "Lifted. Classic hoops detailing. Strappy but easy to wear. Check all the boxes in the Nike Icon Classic. Its big, bold midsole wows with comfort. The outsole pattern delivers iconic Air Force 1 vibes, while the multiple hook-and-loop straps add a fearless look. Get ready to shine with this new voice in sandal style.",
  list_price: 65,
  sale_price: 48.97,
  article_number: "DH0224-100",
  division: "Women",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Air Presto",
  subtitle: "Women's Shoes",
  description: "Designed to feel cozier than your favorite t-shirt, the comfort of this Nike Air Presto will have others green with envy. Made to feel good and look fast, these kicks feature supersoft foam for cushioning and a stretchy upper sleeve with a sock-like fit for support. Put them on and you’ll never want to take them off.",
  list_price: 130,
  sale_price: 99.97,
  article_number: "DV2228-300",
  division: "Women",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Blazer Low '77 By You",
  subtitle: "Custom Women's Shoes",
  description: "Praised for its classic simplicity and comfort, the original hoops look is now yours to customize. From a variety of materials, including a floral graphic on canvas, to fun-loving summertime colors, it lets you leave your mark. Then dive into the details: laces and a personalized inscription are just some of the options for tailoring your look.",
  list_price: 115,
  sale_price: nil,
  article_number: "DZ2653-900",
  division: "Women",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Blazer Mid Premium",
  subtitle: "Women's Shoes",
  description: "Styled for the ‘70s. Loved in the ‘80s. Classic in the ‘90s. Ready for the future. The Nike Blazer Mid gives you a timeless design that’s easy to wear. The era-echoing leather upper and bold branding make it look like you’ve just pulled them from the history books. Go ahead—perfect your outfit.",
  list_price: 125,
  sale_price: 85.97,
  article_number: "DQ7572-300",
  division: "Women",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Air Huarache By You",
  subtitle: "Custom Women's Shoes",
  description: "Have you hugged your foot today? Don't stop there. Bring your feel-good vibes to the world with a customizable twist on the ridiculously comfortable icon. Choose soft, supple suede for a throwback vibe, or give it a timeless finish with crisp leather. Select from an array of varsity-inspired colors for a classic look. Then, top it off with a piece of your story on the tongue patch. Whatever you choose, it's gonna feel good and look great. Your personalized Air Huarache—it's bragging rights for your feet. We recommend sizing up one half-size from your usual size for the best fit.",
  list_price: 130,
  sale_price: nil,
  article_number: "FD9782-900",
  division: "Women",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Cosmic Unity 3",
  subtitle: "Basketball Shoes",
  description: "Better for your game, designed with sustainability in mind—two things you care about—the Cosmic Unity 3 has a secure, lightweight design for a low-to-the-ground feel. It gives you cloud-like cushioning for explosive speed and quick changes in direction, the difference-makers in a game that’s becoming more extraterrestrial.",
  list_price: 170,
  sale_price: nil,
  article_number: "DV2757-005",
  division: "Women",
  category: "Shoes",
  sub_category: "Basketball"
)
Product.create!(
  name: "Sabrina 1 'Beyond The Game'",
  subtitle: "Basketball Shoes",
  description: "Sabrina Ionescu's game is unique, hard to define and built with an undeniable craft. Her signature shoe helps you unlock your versatility with a snappy forefoot Zoom Air unit and cloud-like React foam to help keep you energized. We used insights from next-gen athletes of all genders around the world to bring grippy, best-in-class traction, reliable midfoot support and stability to the court—which every hooper needs. Built for crafty players like Sabrina, but made for anyone who's ready to put in the work to take their game to the next level.",
  list_price: 130,
  sale_price: nil,
  article_number: "FQ3381-003",
  division: "Women",
  category: "Shoes",
  sub_category: "Basketball"
)
Product.create!(
  name: "LeBron Witness 6",
  subtitle: "Basketball Shoes",
  description: "For this iteration of the LeBron Witness, we swapped out Zoom Air for visible Max Air cushioning—LeBron's favorite—to help dissipate impact forces and provide a responsive sensation. The lightweight, reinforced mesh upper keeps you contained all around, from the webbing that harnesses your forefoot to the external molded pieces that lock in your heel.",
  list_price: 105,
  sale_price: 73.97,
  article_number: "CZ4052-300",
  division: "Women",
  category: "Shoes",
  sub_category: "Basketball"
)
Product.create!(
  name: "LeBron Witness 7",
  subtitle: "Basketball Shoes",
  description: "The longer LeBron’s legendary career continues, the more his game needs a design that doesn’t weigh him down, yet can still control all that sublime power. So, we’ve created our lightest LeBron model but with the kind of bankable support that can help you stay in front of your opponent with the game on the line. Full-length Max Air cushioning helps you take off and land confidently, while lightweight mesh blends with containment cables to help keep you locked in for 4 quarters or more.",
  list_price: 105,
  sale_price: 84.97,
  article_number: "DM1123-006",
  division: "Women",
  category: "Shoes",
  sub_category: "Basketball"
)
Product.create!(
  name: "KD Trey 5 X",
  subtitle: "Basketball Shoes",
  description: "With its lightweight upper and plush support system, the KD Trey 5 X can help you float like KD, waiting for the perfect moment to drive to the hoop. A secure midfoot strap is suited for scoring binges and defensive stands, so that you can lock in and keep winning.",
  list_price: 95,
  sale_price: 83.97,
  article_number: "DD9538-102",
  division: "Women",
  category: "Shoes",
  sub_category: "Basketball"
)
Product.create!(
  name: "LeBron Witness 7 (Team)",
  subtitle: "Basketball Shoes",
  description: "The longer LeBron’s legendary career continues, the more his game needs a design that doesn’t weigh him down, yet can still control all that sublime power. So, we’ve created our lightest LeBron model but with the kind of bankable support that can help you stay in front of your opponent with the game on the line. Full-length Max Air cushioning helps you take off and land confidently, while lightweight mesh blends with containment cables to help keep you locked in for 4 quarters or more.",
  list_price: 110,
  sale_price: 93.97,
  article_number: "DZ3299-100",
  division: "Women",
  category: "Shoes",
  sub_category: "Basketball"
)
Product.create!(
  name: "Nike Elevate 3",
  subtitle: "Basketball Shoes",
  description: "Level up your game on both ends of the floor in the Nike Renew Elevate 3. Specifically tuned for 2-way players who want to make an impact offensively and defensively, this shoe helps you optimize your ability with all-game, all-season support and stability. Improved traction and arch support enhance cutting and pivoting, which can make the difference down the stretch.",
  list_price: 85,
  sale_price: 71.97,
  article_number: "DD9304-100",
  division: "Women",
  category: "Shoes",
  sub_category: "Basketball"
)
Product.create!(
  name: "Giannis Immortality 2",
  subtitle: "Basketball Shoes",
  description: "Morph into all-timer with the Giannis Immortality 2. A plush foam package combined with a more focused fit in the midfoot in a super lightweight design means you can maintain a high level of intensity and focus when victory hangs in the balance—just like Giannis in the clutch.",
  list_price: 85,
  sale_price: 72.97,
  article_number: "DM0825-103",
  division: "Women",
  category: "Shoes",
  sub_category: "Basketball"
)
Product.create!(
  name: "Nike Renew Elevate 3",
  subtitle: "Women's Basketball Shoes",
  description: "Level up your game on both ends of the floor in the Nike Renew Elevate 3. Specifically tuned for two-way players who want to make an impact offensively and defensively, this shoe helps you optimize your ability with all-game, all-season support and stability. Improved traction and arch support enhance cutting and pivoting, which can make the difference down the stretch.",
  list_price: 80,
  sale_price: 68.97,
  article_number: "FQ8971-600",
  division: "Women",
  category: "Shoes",
  sub_category: "Basketball"
)
Product.create!(
  name: "LeBron NXXT Gen AMPD",
  subtitle: "Basketball Shoes",
  description: "Whether you’re a dunk contest-like leaper or a below-the-rim wonder roaming the baseline, feel fast, low to the court and assured in the LeBron NXXT Gen. We specifically tailored it to meet the demands of today’s fast-paced game, so that you can stay ahead of the opposition with your speed in all directions.",
  list_price: 170,
  sale_price: nil,
  article_number: "FJ1566-100",
  division: "Women",
  category: "Shoes",
  sub_category: "Basketball"
)
Product.create!(
  name: "Nike Sportswear Essential",
  subtitle: "Women's T-Shirt",
  description: "Say hello to your go-to cotton tee. Slightly dropped shoulder seams and a loose fit make it comfortable enough to wear around the house yet elevated enough to wear out in the city.",
  list_price: 30,
  sale_price: nil,
  article_number: "FD4149-625",
  division: "Women",
  category: "Clothing",
  sub_category: "Tops"
)
Product.create!(
  name: "Nike Sportswear Essential",
  subtitle: "Women's Ribbed Long-Sleeve Mod Crop Top",
  description: "Versatile and customizable—drawstrings on both sides let you decide if you want to wear this top long or cropped. And no matter how you style it, the lightweight, ribbed fabric feels comfy all day long!",
  list_price: 52,
  sale_price: nil,
  article_number: "FB8717-386",
  division: "Women",
  category: "Clothing",
  sub_category: "Tops"
)
Product.create!(
  name: "Nike Sportswear Classic",
  subtitle: "Women's T-Shirt",
  description: "1972, the year we launched the first Nike shoe, serves as a reminder of the past as you reach towards the future. Heavyweight cotton gives you a structured and premium feel, while the boxy fit and dropped shoulder seams create a relaxed look without feeling too big. Classic and timeless—this tee does it all.",
  list_price: 40,
  sale_price: nil,
  article_number: "FQ6600-371",
  division: "Women",
  category: "Clothing",
  sub_category: "Tops"
)
Product.create!(
  name: "Nike FutureMove",
  subtitle: "Women's Dri-FIT Long-Sleeve Sheer Top",
  description: "Feel fierce in whatever you do in this fitted top. Ultrasmooth, sheer fabric with sweat-wicking tech gives you a bold look while helping you stay cool and dry through all your moves.",
  list_price: 60,
  sale_price: nil,
  article_number: "FQ1872-010",
  division: "Women",
  category: "Clothing",
  sub_category: "Tops"
)
Product.create!(
  name: "Nike One Fitted",
  subtitle: "Women's Dri-FIT Strappy Cropped Tank Top",
  description: "Up for a workout or down to chill, this Nike One Fitted tank top is ready for whatever you are. Midweight, peachy-soft fabric stretches with your every move and dries quickly. Slightly cropped and snug, it's ready to meet your favorite high-waisted leggings for a head-to-toe look that you can feel confident and comfortable in from your morning stroll to your evening wind-down—and at all the stops in between.",
  list_price: 40,
  sale_price: nil,
  article_number: "FN2858-010",
  division: "Women",
  category: "Clothing",
  sub_category: "Tops"
)
Product.create!(
  name: "Nike One Fitted",
  subtitle: "Women's Dri-FIT Mock-Neck Cropped Tank Top",
  description: "Up for a workout or down to chill, this Nike One Fitted top is ready for whatever you are. Midweight, peachy-soft fabric stretches with your every move and dries quickly. Slightly cropped and snug, it's ready to meet your favorite high-waisted leggings for a head-to-toe look that you can feel confident and comfortable in from your morning stroll to your evening wind-down—and at all the stops in between.",
  list_price: 50,
  sale_price: nil,
  article_number: "FN2906-237",
  division: "Women",
  category: "Clothing",
  sub_category: "Tops"
)
Product.create!(
  name: "Nike One Classic",
  subtitle: "Women's Dri-FIT Short-Sleeve Cropped Twist Top",
  description: "Up for a workout or down to chill, this Nike One Classic top is ready for whatever you are. Lightweight, silky-smooth fabric dries quickly and works for wherever your day takes you. Its twisted back design adds an edge to your look while giving you plenty of airflow, helping you stay cool and comfortable from your morning stroll to your evening wind down—and all the stops in between.",
  list_price: 45,
  sale_price: nil,
  article_number: "FN2851-208",
  division: "Women",
  category: "Clothing",
  sub_category: "Tops"
)
Product.create!(
  name: "Nike One Fitted",
  subtitle: "Women's Dri-FIT Short-Sleeve Cropped Top",
  description: "Up for a workout or down to chill, this Nike One Fitted top is ready for whatever you are. Midweight, peachy-soft fabric stretches with your every move and dries quickly. Slightly cropped and snug, it's ready to meet your favorite high-waisted leggings for a head-to-toe look that you can feel confident and comfortable in from your morning stroll to your evening wind-down—and at all the stops in between.",
  list_price: 45,
  sale_price: nil,
  article_number: "FN2804-100",
  division: "Women",
  category: "Clothing",
  sub_category: "Tops"
)
Product.create!(
  name: "Nike One Classic",
  subtitle: "Women's Dri-FIT Long-Sleeve Top",
  description: "Up for a workout or down to chill, this Nike One Classic top is ready for whatever you are. Lightweight, silky-smooth fabric dries quickly and works for wherever your day takes you. A timeless, easy-fitting style and sweat-wicking tech help you feel confident, comfortable and dry from your morning stroll to your evening wind-down—and at all the stops in between.",
  list_price: 50,
  sale_price: nil,
  article_number: "FN2801-100",
  division: "Women",
  category: "Clothing",
  sub_category: "Tops"
)
Product.create!(
  name: "Nike One Classic",
  subtitle: "Women's Dri-FIT Cropped Tank Top",
  description: "Up for a workout or down to chill, this Nike One Classic tank top is ready for whatever you are. Lightweight, silky-smooth fabric dries quickly and works for wherever your day takes you. A timeless, easy-fitting style and sweat-wicking tech help you feel confident, comfortable and dry from your morning stroll to your evening wind-down—and at all the stops in between.",
  list_price: 40,
  sale_price: nil,
  article_number: "FN2845-440",
  division: "Women",
  category: "Clothing",
  sub_category: "Tops"
)
Product.create!(
  name: "Nike One Classic",
  subtitle: "Women's Dri-FIT Short-Sleeve Top",
  description: "Up for a workout or down to chill, this Nike One Classic top is ready for whatever you are. Lightweight, silky-smooth fabric dries quickly and works for wherever your day takes you. A timeless, easy-fitting style and sweat-wicking tech help you feel confident, comfortable and dry from your morning stroll to your evening wind-down—and at all the stops in between.",
  list_price: 45,
  sale_price: nil,
  article_number: "FN2798-440",
  division: "Women",
  category: "Clothing",
  sub_category: "Tops"
)
Product.create!(
  name: "Nike One Classic",
  subtitle: "Women's Dri-FIT Short-Sleeve Cropped Top",
  description: "Up for a workout or down to chill, this Nike One Classic top is ready for whatever you are. Lightweight, silky-smooth fabric dries quickly and works for wherever your day takes you. A timeless, easy-fitting style and sweat-wicking tech help you feel confident, comfortable and dry from your morning stroll to your evening wind-down—and at all the stops in between.",
  list_price: 45,
  sale_price: nil,
  article_number: "FN2824-675",
  division: "Women",
  category: "Clothing",
  sub_category: "Tops"
)
Product.create!(
  name: "Nike One Relaxed",
  subtitle: "Women's Dri-FIT Short-Sleeve Top",
  description: "Up for a workout or down to chill, this Nike One Relaxed top is ready for whatever you are. Slightly textured, incredibly lightweight jersey fabric dries quickly and drapes you in comfort that goes with any activity. A loose, roomy fit and extended length help keep you covered and cozy from your morning stroll to your evening wind-down—and at all the stops in between.",
  list_price: 45,
  sale_price: nil,
  article_number: "FN2814-675",
  division: "Women",
  category: "Clothing",
  sub_category: "Tops"
)
Product.create!(
  name: "Nike Sportswear Essential",
  subtitle: "Women's Oversized T-Shirt",
  description: "Roomy and relaxed, this soft tee is perfect for when you want to rock an oversized look but still be comfy. Heavyweight cotton fabric and a simple Swoosh logo make it an easy pick to pair with your favorite leggings or shorts.",
  list_price: 30,
  sale_price: nil,
  article_number: "DX7910-208",
  division: "Women",
  category: "Clothing",
  sub_category: "Tops"
)
Product.create!(
  name: "Nike Sportswear Essential",
  subtitle: "Women's Slim Cropped T-Shirt",
  description: "Made with our soft jersey fabric, this everyday tee gives you a premium look and feel. Its slim fit and cropped length make it comfortable enough to wear around the house yet elevated enough to wear out in the city.",
  list_price: 30,
  sale_price: nil,
  article_number: "FB2873-208",
  division: "Women",
  category: "Clothing",
  sub_category: "Tops"
)
Product.create!(
  name: "Nike Sportswear Phoenix Fleece",
  subtitle: "Women's High-Waisted Wide-Leg Sweatpants",
  description: "Grounded in style, comfort and versatility, meet our take on luxury loungewear. These high-waisted sweats make a statement with midweight brushed fleece in a full-length, wide-leg design. Soft yet structured, they're anything but basic.",
  list_price: 70,
  sale_price: nil,
  article_number: "DQ5615-675",
  division: "Women",
  category: "Clothing",
  sub_category: "Bottoms"
)
Product.create!(
  name: "Nike Sportswear Club Fleece",
  subtitle: "Women's Mid-Rise Wide-Leg Sweatpants",
  description: "Club Fleece sweats, universally loved for their coziness and consistency, are for everyone. Always soft and just the right weight, they’re basics that help you do more. Make big moves with all of the room in these wide-leg, extra-long pants. The added length draws focus to your shoes, so be sure to lace up your favorite sneakers.",
  list_price: 60,
  sale_price: nil,
  article_number: "FB2727-063",
  division: "Women",
  category: "Clothing",
  sub_category: "Bottoms"
)
Product.create!(
  name: "Nike Sportswear Chill Terry",
  subtitle: "Women's Slim High-Waisted French Terry Sweatpants",
  description: "Grounded in style, comfort and versatility, meet our take on luxury loungewear. Perfect for warmer days, swap out your fleecy sweats for this soft, light option with a slim, tailored fit. They're cozy enough to keep you going throughout all phases of your day.",
  list_price: 70,
  sale_price: nil,
  article_number: "FN2434-051",
  division: "Women",
  category: "Clothing",
  sub_category: "Bottoms"
)
Product.create!(
  name: "Nike Sportswear Club Fleece",
  subtitle: "Women's Mid-Rise Joggers",
  description: "Club Fleece, universally loved for its coziness and consistency, is for everyone. These mid-rise Club Fleece pants have a soft, familiar feel that makes it easy to stay warm and comfortable.",
  list_price: 60,
  sale_price: nil,
  article_number: "DQ5191-619",
  division: "Women",
  category: "Clothing",
  sub_category: "Bottoms"
)
Product.create!(
  name: "Nike Sportswear Club Fleece",
  subtitle: "Women's Mid-Rise Oversized Cargo Sweatpants",
  description: "Club Fleece, universally loved for its coziness and consistency, is for everyone. With a longer, extra-roomy leg, these mid-rise pants are the perfect fit for your favorite fitted tops and hoodies. Cargo pockets add storage for your daily essentials.",
  list_price: 65,
  sale_price: nil,
  article_number: "DQ5196-690",
  division: "Women",
  category: "Clothing",
  sub_category: "Bottoms"
)
Product.create!(
  name: "Nike Dri-FIT Swoosh Fly Standard Issue",
  subtitle: "Women's Basketball Pants",
  description: "Feel fresh both on and off the court in the Nike Dri-FIT Swoosh Fly Standard Issue Basketball Pants. Inspired by the professional on-court women's warm-up, they combine a comfortable and structured feel with technology that's designed to help wick sweat. Swoosh Fly details represent Nike Women's Basketball.",
  list_price: 85,
  sale_price: 72.97,
  article_number: "DA6465-050",
  division: "Women",
  category: "Clothing",
  sub_category: "Bottoms"
)
Product.create!(
  name: "Nike Sportswear",
  subtitle: "Women's High-Waisted Oversized Fleece Sweatpants",
  description: "Rise up and transform your fleece wardrobe with cozy vibes. These oversized sweats have extra room in the legs for a fit that's comfy and relaxed. The taller ribbed waistline sits higher on your hips for a stay-put, snug feel.",
  list_price: 70,
  sale_price: nil,
  article_number: "FQ7984-328",
  division: "Women",
  category: "Clothing",
  sub_category: "Bottoms"
)
Product.create!(
  name: "Nike Dri-FIT Academy",
  subtitle: "Women's Soccer Pants",
  description: "Heading to early morning practice or warming up before the match, these breathable soccer pants are designed with tech to help keep you cool and dry as you work up a sweat. With mesh panels down the legs and an elastic waistband, you can stay comfortable however you choose to play.",
  list_price: 55,
  sale_price: nil,
  article_number: "DX0508-237",
  division: "Women",
  category: "Clothing",
  sub_category: "Bottoms"
)
Product.create!(
  name: "Nike Sportswear Tech Fleece",
  subtitle: "Women's Mid-Rise Joggers",
  description: "Can you believe it's already been 10 years of Tech Fleece? We’re celebrating the occasion with the timeless tailored design you know in a new color palette inspired by natural minerals. Our premium, smooth-on-both-sides fleece feels warmer and softer than ever, while keeping the same lightweight build you love. Complete your look with the matching jacket or your favorite top. The future of fleece starts here.",
  list_price: 120,
  sale_price: nil,
  article_number: "FB8330-237",
  division: "Women",
  category: "Clothing",
  sub_category: "Bottoms"
)
Product.create!(
  name: "Nike Sportswear Club Fleece",
  subtitle: "Women's Mid-Rise Oversized Sweatpants",
  description: "Soft and warm, these oversized Club Fleece sweatpants are perfect for days when comfort is everything. Loose through the hip and thigh, the leg is finished with an elasticated cuff at the ankle for a perfectly cinched-in look.",
  list_price: 60,
  sale_price: nil,
  article_number: "DQ5800-126",
  division: "Women",
  category: "Clothing",
  sub_category: "Bottoms"
)
Product.create!(
  name: "Nike Sportswear",
  subtitle: "Women's Pants",
  description: "Keep it classic and customizable in these Nike Sportswear Pants. Using soft and smooth knit fabric, the wide, straight-leg cut with pin tucks gives a streamlined look that can easily be dressed up or down. Plus, side snaps add versatility for a sporty edge and soft style.",
  list_price: 80,
  sale_price: nil,
  article_number: "FZ7279-247",
  division: "Women",
  category: "Clothing",
  sub_category: "Bottoms"
)
Product.create!(
  name: "Nike Dri-FIT Get Fit",
  subtitle: "Women's Training Pants",
  description: "The Nike Dri-FIT Get Fit Pants have sweat-wicking technology to help you stay dry while you work out. French terry fabric feels soft and comfortable.",
  list_price: 62,
  sale_price: nil,
  article_number: "CU5495-010",
  division: "Women",
  category: "Clothing",
  sub_category: "Bottoms"
)
Product.create!(
  name: "Nike Yoga Dri-FIT Luxe",
  subtitle: "Women's Flared Pants",
  description: "Keep it simple—but not basic—in these flare-leg, high-waisted pants. Their Infinalon fabric is irresistibly soft and smooth while giving a gently compressive feel that hugs your body so you can stretch and move without limits. With sweat-wicking fabric and a wide waistband, you'll feel cool and supported as you move from pose to pose.",
  list_price: 110,
  sale_price: nil,
  article_number: "DV9181-010",
  division: "Women",
  category: "Clothing",
  sub_category: "Bottoms"
)
Product.create!(
  name: "Nike Dri-FIT Prima",
  subtitle: "Women's High-Waisted 7/8 Training Pants",
  description: "From your morning walk to your training workout and all the activities between, you can feel comfortable and confident in these loose-fit pants. Irresistibly smooth and sleek, their premium fabric feels soft and airy, with the perfect amount of flex and stretch for all of your moves. It's the pair you won't want to take off—and with sweat-wicking tech and a polished look, you don't have to.",
  list_price: 100,
  sale_price: nil,
  article_number: "FB5428-208",
  division: "Women",
  category: "Clothing",
  sub_category: "Bottoms"
)
Product.create!(
  name: "Nike Sportswear Phoenix Fleece",
  subtitle: "Women's High-Waisted Cropped Sweatpants",
  description: "Grounded in style, comfort and versatility, meet our take on luxury loungewear. With a wide-leg design and cropped length, these sweats keep you looking anything but basic while the midweight brushed fleece keeps you cozy all day long.",
  list_price: 70,
  sale_price: nil,
  article_number: "FB8313-208",
  division: "Women",
  category: "Clothing",
  sub_category: "Bottoms"
)
Product.create!(
  name: "Nike Bliss",
  subtitle: "Women's Dri-FIT Trousers",
  description: "Move beyond the gym in comfort and style in these loose-fitting trousers. Feather-light, with plenty of stretch, their moisture-wicking fabric helps keep you dry and cool as it flows with you in all your moves. Front pleats elevate your look and a traditional zip fly lets you change with ease.",
  list_price: 105,
  sale_price: nil,
  article_number: "FQ2166-010",
  division: "Women",
  category: "Clothing",
  sub_category: "Bottoms"
)
Product.create!(
  name: "Nike Sportswear Essential",
  subtitle: "Women's Mid-Rise Pants",
  description: "Made with a lightweight, recycled crinkle woven fabric and a roomy fit, these pants are all about comfort. An inset Swoosh logo on the leg provides a signature Nike look ready to pair with your favorite sneakers. This product is made with 100% recycled polyester and recycled nylon fibers.",
  list_price: 90,
  sale_price: nil,
  article_number: "DM6183-010",
  division: "Women",
  category: "Clothing",
  sub_category: "Bottoms"
)
Product.create!(
  name: "Nike Air Force 1 LE",
  subtitle: "Big Kids' Shoes",
  description: "This is what legends are made of. The Nike Air Force 1 LE brings back the ’82 hardwood icon into an everyday style in all-white or all-black. The durability, feel and Air are still there for those who love a classic.",
  list_price: 90,
  sale_price: nil,
  article_number: "DH2920-111",
  division: "Kids",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Air Jordan 1 Low SE",
  subtitle: "Big Kids' Shoes",
  description: "Where's that cool breeze coming from? Oh, it's you in these icy AJ1s! These season-ready kicks come with a bevy of wintery details: iced clear outsole, 'frozen' textured leather overlays, and that glitter-filled Swoosh inspired by a swirling snow globe. Shake up your winter look.",
  list_price: 95,
  sale_price: nil,
  article_number: "FQ9112-100",
  division: "Kids",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Air Force 1",
  subtitle: "Big Kids' Shoes",
  description: "Kick it in comfort in the Nike Air Force 1. Durable matte leather and ripstop textiles pair with reflective details for a sturdy construction that's ready for wherever playtime takes you. Plus, a translucent outsole and Nike Air cushioning give you the timeless style and comfort that continues to make the AF1 a slam dunk.",
  list_price: 100,
  sale_price: 85.97,
  article_number: "FV3980-001",
  division: "Kids",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Air Jordan 1 Mid SE",
  subtitle: "Big Kids' Shoes",
  description: "What's that cool breeze comin' in? Oh, it's you in these icy J's! This season-ready pair comes with a bevy of special details: an iced clear outsole, 'frozen' textured leather overlays, and that glitter-filled Swoosh inspired by the mesmerizing swirl of a snow globe. Shake up your winter look.",
  list_price: 120,
  sale_price: nil,
  article_number: "FQ9117-400",
  division: "Kids",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Air Jordan 1 Mid",
  subtitle: "Big Kids' Shoes",
  description: "This iteration of the AJ1 reimagines Mike's first signature model with a fresh mix of colors. Premium materials, soft cushioning and a padded ankle collar offer total support and celebrate the shoe that started it all.",
  list_price: 110,
  sale_price: nil,
  article_number: "DQ8423-511",
  division: "Kids",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Air Jordan 1 Low",
  subtitle: "Big Kids' Shoes",
  description: "An iconic look that lasts. This AJ1 pairs the classic design of the original with premium materials that will keep you going all day.",
  list_price: 90,
  sale_price: 76.97,
  article_number: "553560-140",
  division: "Kids",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Dunk Low",
  subtitle: "Big Kids' Shoes",
  description: "Show love to the ‘80s with the Nike Dunk Low. From the super durable build to the shoe’s classic shape and feel, we honor this hardwood icon that’ll fit easily into your kicks collection and is always ready to play.",
  list_price: 90,
  sale_price: 69.97,
  article_number: "DH9765-104",
  division: "Kids",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Court Legacy",
  subtitle: "Big Kids' Shoes",
  description: "The Nike Court Legacy serves up style rooted in tennis culture. They are durable and comfy with heritage stitching and a retro Swoosh. When you pull these on—it’s game, set, match.",
  list_price: 55,
  sale_price: 28.97,
  article_number: "DA5380-119",
  division: "Kids",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Air Force 1",
  subtitle: "Big Kids' Shoes",
  description: "The Nike AF1s are a legend. First on the basketball courts in the '80s. Now wearable everywhere from school to the playground. They've been an icon for decades—meaning a long time! Smooth durable leather lasts for many days of play. Fun colors bring an extra push to get you moving outside.",
  list_price: 90,
  sale_price: 68.97,
  article_number: "DV7762-101",
  division: "Kids",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Dunk Low",
  subtitle: "Big Kids' Shoes",
  description: "Designed for basketball but adopted by skaters, the Nike Dunk Low helped define sneaker culture. Now this mid-'80s icon is an easy score for your closet. With ankle padding and durable rubber traction, these are a slam dunk whether you're learning to skate or getting ready for school.",
  list_price: 90,
  sale_price: nil,
  article_number: "FB9109-300",
  division: "Kids",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Air Max Plus",
  subtitle: "Big Kids' Shoes",
  description: "Who says kids don't deserve big cushioning? Not us. Get a taste of our legendary Tuned Air technology with the Nike Air Max Plus. From the school yard to your backyard, these comfy kicks are ready to play with breathable mesh fabric up top and a durable rubber sole underfoot. Plus, wavy design lines and iconic plastic accents celebrate bold style.",
  list_price: 145,
  sale_price: nil,
  article_number: "CD0609-024",
  division: "Kids",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Dunk Low",
  subtitle: "Big Kids' Shoes",
  description: "Created for the hardwood but taken to the streets, this ‘80s basketball icon returns with smooth matte finished overlays and original flair. With its classic design, the Nike Dunk channels vintage style while its padded, low-cut collar and gum outsole lets you take your game anywhere—in comfort.",
  list_price: 90,
  sale_price: nil,
  article_number: "FV0374-100",
  division: "Kids",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Dunk Low",
  subtitle: "Big Kids' Shoes",
  description: "Whether you're a hooper, a skater or you just love kicks, the Nike Dunk Low has been a fave among athletes for decades. Durable synthetic leather gives you a classic '80s feel while the rubber sole offers grip and traction.",
  list_price: 100,
  sale_price: nil,
  article_number: "FV0365-100",
  division: "Kids",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Flex Runner 2",
  subtitle: "Big Kids' Road Running Shoes",
  description: "Running shoes made easy! The Nike Flex Runner 2 is for the kid on the go who loves to play all day—from gym class to a sprint down the block. They're lace-free, meaning super quick to slip on and off. Who’s ready to race?",
  list_price: 52,
  sale_price: nil,
  article_number: "DJ6038-002",
  division: "Kids",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Dunk Low",
  subtitle: "Big Kids' Shoes",
  description: "If you love old-school hoops, you'll love this Nike Dunk. Thoughtfully made with durable synthetic leather for a classic court feel, these kicks honor a hardwood icon with a design you can easily rock from class to the park and everywhere in between.",
  list_price: 90,
  sale_price: nil,
  article_number: "FV0373-001",
  division: "Kids",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike Dunk Low",
  subtitle: "Big Kids' Shoes",
  description: "The Nike Dunk Low is an easy score for your closet. This mid-‘80s hoops icon returns with super-durable construction and original colors. With ankle padding and rubber traction, this one is a slam dunk.",
  list_price: 90,
  sale_price: nil,
  article_number: "CW1590-100",
  division: "Kids",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Air Max 1",
  subtitle: "Big Kids' Shoes",
  description: "With its easygoing lines, heritage track look and of course, visible Air cushioning, the Nike Air Max 1 is the perfect finish to any outfit. The rich mixture of materials adds depth while making it a durable and lightweight shoe for everyday wear.",
  list_price: 100,
  sale_price: nil,
  article_number: "DZ3307-106",
  division: "Kids",
  category: "Shoes",
  sub_category: "Lifestyle"
)
Product.create!(
  name: "Nike G.T. Cut 3",
  subtitle: "Big Kids' Basketball Shoes",
  description: "Ready to zigzag across the court with ease? Start by lacing up the Nike G.T. Cut 3. Made for a new generation of players, its advanced traction helps give you the grip you need to shake, stop and cross up defenders as you fly to the hoop. Light and springy foam helps cushion every step so you can cut and create space in comfort. Plus, getting game ready is easy with the wide collar opening—just grab the loops to pull these on and lace 'em up. This is the future of hoops.",
  list_price: 95,
  sale_price: nil,
  article_number: "FD7033-101",
  division: "Kids",
  category: "Shoes",
  sub_category: "Basketball"
)
Product.create!(
  name: "Air Jordan Legacy 312 Low",
  subtitle: "Big Kids' Shoes",
  description: "The Air Jordan Legacy 312 celebrates MJ's legacy with this shout-out to Chicago's 312 area code. The design creates a modern mash-up of iconic Jordan elements.",
  list_price: 100,
  sale_price: nil,
  article_number: "CD9054-146",
  division: "Kids",
  category: "Shoes",
  sub_category: "Basketball"
)
Product.create!(
  name: "Nike Air More Uptempo",
  subtitle: "Big Kids' Shoes",
  description: "One thing stands out about the Nike Air More Uptempo. Can you guess what that might be? Need a hint? It's all about the A-I-R! These everyday shoes were in a league of their own in the '90s. Now, they're ready to help you blaze a new trail with the swag of a legend and the lasting comfort of Air cushioning.",
  list_price: 140,
  sale_price: nil,
  article_number: "FJ2846-100",
  division: "Kids",
  category: "Shoes",
  sub_category: "Basketball"
)
Product.create!(
  name: "Giannis Freak 4",
  subtitle: "Big Kids' Basketball Shoes",
  description: "Put up monster numbers. Feel like an MVP. And now, play like a champ with the Freak 4. Giannis’ 4th signature shoe comes packed with the finest of the Freak’s game. Made to feel ultra-comfy and fast on the court, plus details designed just for the All-Star, carry the swag of everything Giannis when it’s time to hoop.",
  list_price: 105,
  sale_price: 71.97,
  article_number: "DQ0553-103",
  division: "Kids",
  category: "Shoes",
  sub_category: "Basketball"
)
Product.create!(
  name: "Air Jordan XXXVII",
  subtitle: "Big Kids' Shoes",
  description: "You've got the hops and the speed—lace up in shoes that enhance what you bring to the court. The latest AJ is all about takeoffs and landings, with multiple Air units to get you off the ground and our signature Formula 23 foam to cushion your impact. Up top, you'll find layers of tough, reinforced leno-weave fabric that'll keep you contained—and leave your game uncompromised—no matter how fast you move.",
  list_price: 140,
  sale_price: 70.97,
  article_number: "DD7421-100",
  division: "Kids",
  category: "Shoes",
  sub_category: "Basketball"
)
Product.create!(
  name: "Luka 2 'The Pitch'",
  subtitle: "Big Kids' Shoes",
  description: "Luka is known for his basketball brilliance, but soccer holds a special place in his heart. 'The Pitch' is an homage to Luka’s time as a pro baller in Madrid and his childhood hero’s iconic cleats. Designed for game play, they’re built to help support your step-backs, side-steps and quick-stop action. Bright colors and swaths of animal print make sure you stand out on the court, showcasing your skills—and your style.",
  list_price: 100,
  sale_price: 77.97,
  article_number: "FQ9045-800",
  division: "Kids",
  category: "Shoes",
  sub_category: "Basketball"
)
Product.create!(
  name: "Nike Team Hustle D 11 SE",
  subtitle: "Big Kids' Basketball Shoes",
  description: "Meet the ultimate basketball and recess shoe. Whether you're heading to team practice or chasing friends on the playground, the Nike Team Hustle D 11 covers all of playtime. Our top priority with the 11th edition of this series was to make these super easy to take on and off. Elastic laces help give you a wide opening while a big strap secures your fit. Plus, the cushioning is more plush than previous editions to help you play your best.",
  list_price: 65,
  sale_price: 55.97,
  article_number: "FN6676-300",
  division: "Kids",
  category: "Shoes",
  sub_category: "Basketball"
)
Product.create!(
  name: "Nike Air Zoom Crossover",
  subtitle: "Big Kids' Basketball Shoes",
  description: "Our first basketball shoe inspired by ladies of the league is made for ALL young hoopers to dominate their game. The Nike Air Zoom Crossover, named after a favorite move, brings an extra bounce to your step with Zoom Air while you fly sky high on the court.",
  list_price: 80,
  sale_price: nil,
  article_number: "DC5216-104",
  division: "Kids",
  category: "Shoes",
  sub_category: "Basketball"
)
Product.create!(
  name: "Giannis Immortality 2",
  subtitle: "Big Kids' Basketball Shoes",
  description: "The Giannis Immortality 2 takes after one of basketball’s greats. Built to last wherever you play, you'll feel confident with every dribble—whether it’s game time or practice. Who’s ready to become the next immortal on the court?",
  list_price: 77,
  sale_price: nil,
  article_number: "DQ1943-102",
  division: "Kids",
  category: "Shoes",
  sub_category: "Basketball"
)
Product.create!(
  name: "Giannis Freak 5",
  subtitle: "Big Kids' Basketball Shoes",
  description: "Giannis' superpower abilities are on full display every time he steps on the court. Enter the Freak 5. Stacked with speed for quick first steps and stuffed with springy cushioning that can withstand the all-game grind, his signature shoe lets you feel like the Greek Freak. So go ahead and blow past your friends on your way to the hoop.",
  list_price: 110,
  sale_price: nil,
  article_number: "DZ4486-004",
  division: "Kids",
  category: "Shoes",
  sub_category: "Basketball"
)
Product.create!(
  name: "LeBron Witness 7",
  subtitle: "Big Kids' Basketball Shoes",
  description: "When opponents face LeBron James, they know they're in trouble. Feel like one of the game's greats with lightweight support in all the right places so you can move confidently with every run and jump. A big Max Air unit brings the cushioning you need to fly around the court, while repping everything LeBron.",
  list_price: 97,
  sale_price: nil,
  article_number: "DQ8650-005",
  division: "Kids",
  category: "Shoes",
  sub_category: "Basketball"
)
Product.create!(
  name: "Giannis Freak 5",
  subtitle: "Big Kids' Basketball Shoes",
  description: "Giannis' superpower abilities are on full display every time he steps on the court. Enter the Freak 5. Stacked with speed for quick first steps and stuffed with springy cushioning that can withstand the all-game grind, his signature shoe lets you feel like the Greek Freak. So go ahead and blow past your friends on your way to the hoop.",
  list_price: 110,
  sale_price: 76.97,
  article_number: "DZ4486-500",
  division: "Kids",
  category: "Shoes",
  sub_category: "Basketball"
)
Product.create!(
  name: "Nike Air Zoom Crossover 2 SE",
  subtitle: "Big Kids' Basketball Shoes",
  description: "What's the key to great handles? Footwork. When your feet move fast, you move fast. Designed and refined for everyone with insights from female athletes, this iteration is lighter, bouncier and cushier than the first Crossover. Like little pillows hugging your ankles, the padded collars help give you the extra support and cushioning you need to run 1 more drill or make 1 more cut and dive toward the basket.",
  list_price: 87,
  sale_price: 73.97,
  article_number: "FN6675-500",
  division: "Kids",
  category: "Shoes",
  sub_category: "Basketball"
)
Product.create!(
  name: "Nike Team Hustle D 11",
  subtitle: "Big Kids' Basketball Shoes",
  description: "Ready for new basketball shoes? How about for gym class or just playing outside? Meet the Nike Team Hustle D 11. With this edition of our Team Hustle D series, our top priority is kicks that are super easy to take on and off. Elastic laces give you a wide opening while a big strap secures your fit. Plus, you get plush cushioning. The ultimate basketball and recess shoe is back and ready to play.",
  list_price: 60,
  sale_price: nil,
  article_number: "DV8996-602",
  division: "Kids",
  category: "Shoes",
  sub_category: "Basketball"
)
Product.create!(
  name: "Nike Air Zoom Crossover 2",
  subtitle: "Big Kids' Basketball Shoes",
  description: "This just in—the sky is no longer the limit! You are limitless and ready to take your game to the next level. Tested by female athletes (and ready for everyone), these mid-top basketball shoes have bouncy cushioning in all the right places. Plus, the sawtooth tread pattern gives you the grip you need to confuse your opponents with every crossover.",
  list_price: 82,
  sale_price: nil,
  article_number: "FB2689-600",
  division: "Kids",
  category: "Shoes",
  sub_category: "Basketball"
)
Product.create!(
  name: "Nike Air Zoom Pegasus 40",
  subtitle: "Big Kids' Road Running Shoes",
  description: "40 years. Generations of running. The Pegasus 40 reps the past and future of Nike running. Whether you're gearing up for a school track meet, track practice or fun runs (like your gym class mile), this shoe is for runners of all levels. They're breathable so your feet stay cool with every lap. Zoom Air and bouncy foam team up for the cushioning you need to feel comfortable with every stride. It's time to fly!",
  list_price: 105,
  sale_price: nil,
  article_number: "DX2498-006",
  division: "Kids",
  category: "Shoes",
  sub_category: "Running"
)
Product.create!(
  name: "Nike Star Runner 4 SE",
  subtitle: "Big Kids' Shoes",
  description: "Get out the door fast with a little help from the Star Runner. Designed for easy on and off, an extended heel helps you stretch the opening out wide so you can pull these runners on in a flash. Soft cushioning in the midsole provides a comfortable, springy feel so playing a little longer is always an option. The tread grabs at pavement, grass and gravel to give extra grip while a rubber-wrapped toe toughens up the construction, making these Star Runners ready for the long haul.",
  list_price: 60,
  sale_price: 42.97,
  article_number: "FJ1805-300",
  division: "Kids",
  category: "Shoes",
  sub_category: "Running"
)
Product.create!(
  name: "Nike MD Valiant",
  subtitle: "Big Kids' Shoes",
  description: "These everyday kicks throw it back by mashing up details from ‘80s running shoes. Plus, did you know? The Nike MD Valiant is full of history. They're named after the car that Nike's co-founder sold shoes out of during the early days—the '64 Valiant.",
  list_price: 65,
  sale_price: 56.97,
  article_number: "CN8558-111",
  division: "Kids",
  category: "Shoes",
  sub_category: "Running"
)
Product.create!(
  name: "Nike Run Flow",
  subtitle: "Big Kids' Running Shoes",
  description: "Are you a kid who likes to run the moment you get out of bed? Whether it's heading to school, recess or favorite afternoon activities, you know how much fun running is. The Nike Run Flow helps you do all that with supersoft and responsive cushioning underfoot. This lightweight and breathable shoe also has easy-to-use toggle lacing so you can get out the door fast because why does fun have to wait?",
  list_price: 80,
  sale_price: nil,
  article_number: "DR0472-101",
  division: "Kids",
  category: "Shoes",
  sub_category: "Running"
)
Product.create!(
  name: "Nike Infinity Flow",
  subtitle: "Big Kids' Running Shoes",
  description: "What separates the Infinity Flow from the rest of the pack? For starters, we stacked it with soft and bouncy foam to help absorb impact and cushion your every stride. Plus, a breathable mesh upper helps keep your feet cool as you burn through each mile.",
  list_price: 92,
  sale_price: nil,
  article_number: "FD6058-002",
  division: "Kids",
  category: "Shoes",
  sub_category: "Running"
)
Product.create!(
  name: "Nike Free Run 2",
  subtitle: "Big Kids' Shoes",
  description: "Comfy, flexible and super easy to wear—the Nike Free Run 2 transforms a running shoe into all-day play-ready shoes. The deep grooves in the sole are the signature of the Free’s “barefoot-like” feel. With plush details and soft foam underfoot, you can count on these versatile low-tops from class to playtime and everywhere in between.",
  list_price: 80,
  sale_price: 62.97,
  article_number: "DD0163-101",
  division: "Kids",
  category: "Shoes",
  sub_category: "Running"
)
Product.create!(
  name: "Nike Air Zoom Arcadia 2",
  subtitle: "Big Kids' Road Running Shoes",
  description: "Race day is every day! Get those feel-good, starting line vibes when you pull on the Nike Air Zoom Arcadia 2. Jog, run or sprint with an extra push from our responsive Zoom Air cushioning. An improved fit up top makes sure it’s not too tight or loose while you go the extra mile.",
  list_price: 77,
  sale_price: nil,
  article_number: "DM8491-102",
  division: "Kids",
  category: "Shoes",
  sub_category: "Running"
)
Product.create!(
  name: "Nike Free Run 2",
  subtitle: "Big Kids' Shoes",
  description: "Comfy, flexible and super easy to wear—the Nike Free Run 2 transforms a running shoe into all-day play-ready shoes. The deep grooves in the sole are the signature of the Free’s “barefoot-like” feel. With plush details and soft foam underfoot, you can count on these versatile low-tops from class to playtime and everywhere in between.",
  list_price: 80,
  sale_price: 56.97,
  article_number: "DD0163-100",
  division: "Kids",
  category: "Shoes",
  sub_category: "Running"
)
Product.create!(
  name: "Nike Revolution 6",
  subtitle: "Big Kids' Road Running Shoes",
  description: "We prioritize comfort, especially for our growing athletes. Made with 20% recycled content by weight, you can take these lightweight, breathable running shoes from all-day play to anytime wear and even track practice. Lightweight, breathable and cushioned for growing feet, the race starts now.",
  list_price: 65,
  sale_price: 45.97,
  article_number: "DD1096-608",
  division: "Kids",
  category: "Shoes",
  sub_category: "Running"
)
Product.create!(
  name: "Nike Omni Multi-Court",
  subtitle: "Big Kids' Indoor Court Shoes",
  description: "What’s Omni, you ask? It means universal, inclusive and all—like for all your indoor sport needs. Durable and lightweight, they help make moving fast feel easy. Choose their favorite indoor court activity—volleyball, basketball, tennis, handball, or gym class—and lace up!",
  list_price: 62,
  sale_price: nil,
  article_number: "DM9027-001",
  division: "Kids",
  category: "Shoes",
  sub_category: "Running"
)
Product.create!(
  name: "Nike Tanjun EasyOn",
  subtitle: "Big Kids' Shoes",
  description: "Find your way to adventure fast with the Nike Tanjun EasyOn. The hands-free collapsible heel and extended tab let you slip them on and hit the road in seconds. A wide base, flex grooves and foam underfoot all work together so you can run, jump and play with confidence.",
  list_price: 65,
  sale_price: nil,
  article_number: "DX9041-001",
  division: "Kids",
  category: "Shoes",
  sub_category: "Running"
)
Product.create!(
  name: "Nike Flex Runner 2",
  subtitle: "Big Kids' Road Running Shoes",
  description: "Running shoes made easy! The Nike Flex Runner 2 is for the kid on the go who loves to play all day—from gym class to a sprint down the block. They're lace-free, meaning super quick to slip on and off. Who’s ready to race?",
  list_price: 52,
  sale_price: nil,
  article_number: "DJ6038-400",
  division: "Kids",
  category: "Shoes",
  sub_category: "Running"
)
Product.create!(
  name: "Nike Star Runner 4",
  subtitle: "Big Kids' Road Running Shoes",
  description: "Because ice-cream trucks, games of tag and races to the end of the street and back can only wait for so long, we made it easy for you to slip the Star Runner on and get going. Soft cushioning in the midsole provides a comfortable, springy feel so every skip, hop and stride you take is one closer to the finish line. The tread grabs at pavement, grass and gravel to give you extra grip while a rubber-wrapped toe toughens up the construction so you can go further in the same pair of Star Runners.",
  list_price: 57,
  sale_price: nil,
  article_number: "DX7615-400",
  division: "Kids",
  category: "Shoes",
  sub_category: "Running"
)
Product.create!(
  name: "Nike Pegasus 40",
  subtitle: "Big Kids' Road Running Shoes",
  description: "The Pegasus 40 reps the past and future of Nike running. Whether you're gearing up for a school track meet or just running around the playground, these shoes will help get you there. Breathable on top and bouncy on bottom, the lightweight design flexes with your foot so you comfortably cut, corner and spring into action when it's time to play.",
  list_price: 105,
  sale_price: 89.97,
  article_number: "FV3645-381",
  division: "Kids",
  category: "Shoes",
  sub_category: "Running"
)
Product.create!(
  name: "Nike Revolution 7",
  subtitle: "Big Kids' Running Shoes",
  description: "Flash, dash and blast into every day with the help of these Revolution Running Shoes that are made especially for fun. No, they're not loaded with sugar or fireworks, but they do come in awesome colors and designs that'll have you reaching for them every day of the year.",
  list_price: 65,
  sale_price: nil,
  article_number: "FB7689-004",
  division: "Kids",
  category: "Shoes",
  sub_category: "Running"
)
Product.create!(
  name: "Nike Sportswear",
  subtitle: "Big Kids' Cotton T-Shirt",
  description: "The Nike Sportswear T-Shirt is made of cotton for all-day comfort.",
  list_price: 20,
  sale_price: nil,
  article_number: "AR5252-126",
  division: "Kids",
  category: "Clothing",
  sub_category: "Tops"
)
Product.create!(
  name: "Jordan Sneaker School Jumpman Tee",
  subtitle: "Big Kids' (Boys) Tee",
  description: "Wear the historic 1988 photo that inspired the icnonic Jumpman logo, Michael Jordan flying through the air on the front of this soft poly jersey knit tee. It has a little extra weight for a little extra cozy, a regular fit and a tagless crewneck for a comfy feel. Pair this tee with your favorite Jordan bottoms and kicks for a complete head-to-toe look or your favorite jeans for a cool, casual look.",
  list_price: 32,
  sale_price: 24.97,
  article_number: "95C421-023",
  division: "Kids",
  category: "Clothing",
  sub_category: "Tops"
)
Product.create!(
  name: "Jordan",
  subtitle: "Big Kids' (Boys') Tank",
  description: "The Jordan Tank is everything—smooth, breezy and comfy. With hoops style and a big DNA logo, it's hard to go wrong with this warm-weather style.",
  list_price: 58,
  sale_price: nil,
  article_number: "95A773-023",
  division: "Kids",
  category: "Clothing",
  sub_category: "Tops"
)
Product.create!(
  name: "Nike Baseball",
  subtitle: "Big Kids' (Boys') T-Shirt",
  description: "For some of us, it's more than a game. Show everyone what it means to you in this classic cotton tee.",
  list_price: 20,
  sale_price: nil,
  article_number: "B11377P387-DGH",
  division: "Kids",
  category: "Clothing",
  sub_category: "Tops"
)
Product.create!(
  name: "Jordan",
  subtitle: "Big Kids' Air Jordan Time Out T-Shirt",
  description: "Rep Jumpman style in the Air Jordan Time Out T-Shirt, featuring graphic logo prints on a classic tee.",
  list_price: 28,
  sale_price: nil,
  article_number: "95C065-001",
  division: "Kids",
  category: "Clothing",
  sub_category: "Tops"
)
Product.create!(
  name: "Jordan Air Out Tee",
  subtitle: "Big Kids T-Shirt",
  description: "Get out and catch some air in this classic tee, made of smooth jersey knit fabric with a regular fit and a tagless ribbed crewneck for a comfortable feel that lasts all day everyday.",
  list_price: 28,
  sale_price: nil,
  article_number: "95C815-EF9",
  division: "Kids",
  category: "Clothing",
  sub_category: "Tops"
)
Product.create!(
  name: "Nike Dri-FIT Trophy",
  subtitle: "Big Kids' (Boys') Training Top",
  description: "What do we love about this Nike active top? Everything! Sweat doesn’t stand a chance against it, meaning you can rock it with confidence when shooting hoops, going for a run or even when powering through homework after school. The possibilities are endless.",
  list_price: 20,
  sale_price: 16.97,
  article_number: "DQ9020-010",
  division: "Kids",
  category: "Clothing",
  sub_category: "Tops"
)
Product.create!(
  name: "Nike Pro Dri-FIT",
  subtitle: "Big Kids' (Boys') Long-Sleeve Top",
  description: "From the court to the field or even the backyard, this top helps you feel like a champ. The long-sleeve can be worn alone or as an underlayer so you can go all out when it’s play time. This product is made with at least 75% recycled polyester fibers.",
  list_price: 30,
  sale_price: 16.97,
  article_number: "DM8529-091",
  division: "Kids",
  category: "Clothing",
  sub_category: "Tops"
)
Product.create!(
  name: "Nike Sportswear Culture of Basketball",
  subtitle: "Big Kids' T-Shirt",
  description: "Here's the game plan for on and off the court: Try new things (take more shots), be nice (share the court) and have fun (cross up your friends). Do all three in the comfort of this soft cotton tee.",
  list_price: 32,
  sale_price: 27.97,
  article_number: "FD3982-410",
  division: "Kids",
  category: "Clothing",
  sub_category: "Tops"
)
Product.create!(
  name: "Air Jordan 11 Vertical Neo Tee",
  subtitle: "Big Kids T-Shirt",
  description: "Complement your AJ 11's with this classic yet sleek tee, made of jersey knit fabric in a regular fit you can move and play freely in and the ribbed crewneck is tagless for a comfy feel.",
  list_price: 28,
  sale_price: nil,
  article_number: "45C952-001",
  division: "Kids",
  category: "Clothing",
  sub_category: "Tops"
)
Product.create!(
  name: "Nike Sportswear",
  subtitle: "Big Kids' T-Shirt",
  description: "It's no secret that we love Pegasus (we named a shoe after this Greek myth, after all). Now, you can ride off into adventure with your own winged stallion with this relaxed cotton tee. Slightly dropped shoulders and a loose fit through the body make sure you have plenty of room to play.",
  list_price: 38,
  sale_price: 21.97,
  article_number: "FJ6398-410",
  division: "Kids",
  category: "Clothing",
  sub_category: "Tops"
)
Product.create!(
  name: "Nike Pro Dri-FIT",
  subtitle: "Big Kids' (Boys') Short-Sleeve Top",
  description: "Game time! The Nike Pro Dri-FIT Top helps you feel like a champ. This classic-fit shirt can be worn alone or as an under-layer so you can go all out comfortably. This product is made with at least 75% recycled polyester fibers.",
  list_price: 25,
  sale_price: 16.97,
  article_number: "DM8528-100",
  division: "Kids",
  category: "Clothing",
  sub_category: "Tops"
)
Product.create!(
  name: "Nike Sportswear",
  subtitle: "Big Kids' (Girls') Cropped T-Shirt",
  description: "Keep it comfy in the Nike Sportswear T-Shirt. This classic cotton tee in a shorter length is all about the casual vibes.",
  list_price: 20,
  sale_price: nil,
  article_number: "DA6925-620",
  division: "Kids",
  category: "Clothing",
  sub_category: "Tops"
)
Product.create!(
  name: "Jordan 23 Flight",
  subtitle: "Big Kids' Graphic T-Shirt",
  description: "Keep it simple yet classic in this tee, which is made of soft jersey knit fabric, dropped shoulders create a relaxed, modern fit and a tagless neck provides comfy wear.",
  list_price: 25,
  sale_price: nil,
  article_number: "45C990-001",
  division: "Kids",
  category: "Clothing",
  sub_category: "Tops"
)
Product.create!(
  name: "Jordan Anti-Gravity Machines Tee",
  subtitle: "Big Kids T-Shirt",
  description: "Complement your Air Jordans with this tee, which is made of jersey knit fabric in a classic fit, has a regular fit and the ribbed crewneck is tagless for a comfy feel.",
  list_price: 32,
  sale_price: nil,
  article_number: "95C737-001",
  division: "Kids",
  category: "Clothing",
  sub_category: "Tops"
)
Product.create!(
  name: "Nike Sportswear Favorites",
  subtitle: "Big Kids' (Girls') Tie-Dye Leggings",
  description: "Swirling tie-dye in blooms of spring colors on these leggings is a whole vibe. Run, jump and play with comfort and ease right into warmer days.",
  list_price: 40,
  sale_price: 27.97,
  article_number: "DV0066-010",
  division: "Kids",
  category: "Clothing",
  sub_category: "Bottoms"
)
Product.create!(
  name: "Nike Sportswear",
  subtitle: "Big Kids' (Girls') Tracksuit",
  description: "Elevate your game with this perfect Swoosh pairing. The zip-up jacket builds on vintage Nike style to give you a classic fit that hits at the top of the hips. The high-waisted pants give you the coverage you crave, plus flare at the bottom. Swoosh branded piping completes the set—wear them together or mix them in with your favorite Nike gear.",
  list_price: 85,
  sale_price: 72.97,
  article_number: "FD2948-113",
  division: "Kids",
  category: "Clothing",
  sub_category: "Bottoms"
)
Product.create!(
  name: "Nike Sportswear",
  subtitle: "Big Kids' (Girls') Woven Pants",
  description: "There's a special secret you'll love about these pants. Fold over the elastic waistband for the length and look you want, and then…ta-da! See the fun wave of Swoosh logos around the inner waistband. Wear these durable woven pants any day, and for the full look, pair with our matching track jacket.",
  list_price: 50,
  sale_price: 42.97,
  article_number: "FB1269-450",
  division: "Kids",
  category: "Clothing",
  sub_category: "Bottoms"
)
Product.create!(
  name: "Nike Sportswear Club Fleece",
  subtitle: "Big Kids' Open-Hem Pants",
  description: "Run like the wind in these brushed fleece, open hem cuffs. Smooth on the outside, brushed soft on the inside, this lightweight fleece is an easy layer when you want a little extra warmth. Enjoy them whether you're on the court or in the classroom counting down the minutes till you can go play again.",
  list_price: 45,
  sale_price: nil,
  article_number: "FD3010-063",
  division: "Kids",
  category: "Clothing",
  sub_category: "Bottoms"
)
Product.create!(
  name: "Nike",
  subtitle: "Big Kids' (Boys') Poly+ Training Pants",
  description: "Don't know which pants to wear? The Nike Training Pants make that choice easy. These soft, everyday sweats will help you stay warm wherever you go. Psst, there’s also a secret zippered pocket on the back for small items.",
  list_price: 40,
  sale_price: nil,
  article_number: "DM8546-010",
  division: "Kids",
  category: "Clothing",
  sub_category: "Bottoms"
)
Product.create!(
  name: "Nike Air",
  subtitle: "Big Kids' Pants",
  description: "Look to these sweats to keep you in the race when chilly temps try to slow you down. Our midweight brushed fleece feels extra soft on the inside and smooth on the outside, helping you stay cozy while keeping its structured shape. A natural around your favorite sneakers, these comfy sweats help show your love for Nike Air and all things sport.",
  list_price: 75,
  sale_price: 56.97,
  article_number: "FD3216-133",
  division: "Kids",
  category: "Clothing",
  sub_category: "Bottoms"
)
Product.create!(
  name: "Nike Therma-FIT",
  subtitle: "Big Kids' Winterized Pants",
  description: "Thaw out your legs before practice or game day with these toasty winterized pants. Extra smooth on the outside and forever fuzzy on the inside, our thermal fabric is perfect for playing in the cold. That means you can stay out longer in lower temps—because the fun shouldn't end when cold weather arrives.",
  list_price: 60,
  sale_price: 35.97,
  article_number: "FJ6048-325",
  division: "Kids",
  category: "Clothing",
  sub_category: "Bottoms"
)
Product.create!(
  name: "Jordan",
  subtitle: "Big Kids' (Girls') Leggings",
  description: "The Jordan Leggings are soft and stretch-tastic so you can move free and easy all day.",
  list_price: 30,
  sale_price: nil,
  article_number: "45A438-023",
  division: "Kids",
  category: "Clothing",
  sub_category: "Bottoms"
)
Product.create!(
  name: "Nike Sportswear Club Fleece",
  subtitle: "Big Kids' Winterized Pants",
  description: "Combat cold weather with the help of these seriously soft sweats. Plush fleece has a thick, wooly texture that's super fun to wear (and touch!), and the crinkle woven taping on the sides and thick, stretchy ribbing on the cuffs makes them even better. Now you're ready for anything.",
  list_price: 55,
  sale_price: 46.97,
  article_number: "FJ6021-325",
  division: "Kids",
  category: "Clothing",
  sub_category: "Bottoms"
)
Product.create!(
  name: "Nike Sportswear",
  subtitle: "Big Kids' (Boys') Jersey Joggers",
  description: "The Nike Sportswear Joggers are ready to chill. Jersey fabric feels soft and lightweight in a relaxed, comfy fit.",
  list_price: 35,
  sale_price: nil,
  article_number: "DA0809-010",
  division: "Kids",
  category: "Clothing",
  sub_category: "Bottoms"
)
Product.create!(
  name: "Nike Sportswear Icon Fleece EasyOn",
  subtitle: "Big Kids' Loose Joggers",
  description: "The Icon Fleece Joggers are ideal for everything from class to Saturday afternoon adventures. Our midweight brushed fleece feels extra soft on the inside and smooth on the outside, helping you stay cozy while keeping its structured shape. A roomy feel means you stay comfy from morning to night. Plus, our EasyOn pockets help keep your essentials secure—without a zipper!—while you move and play.",
  list_price: 60,
  sale_price: 51.97,
  article_number: "FJ6028-276",
  division: "Kids",
  category: "Clothing",
  sub_category: "Bottoms"
)
Product.create!(
  name: "Nike Therma",
  subtitle: "Big Kids' (Boys') Training Pants",
  description: "The Nike Therma Pants are more than just a regular pair of sweats. The super-cozy style locks in warmth when it’s time to play. Plus, they have a fit that just feels right.",
  list_price: 42,
  sale_price: 24.97,
  article_number: "CU9082-084",
  division: "Kids",
  category: "Clothing",
  sub_category: "Bottoms"
)
Product.create!(
  name: "Nike Sportswear Club Fleece",
  subtitle: "Big Kids' Cargo Pants",
  description: "Keep all your treasures close with these Club Fleece Cargo Pants. Smooth on the outside, brushed soft on the inside, this lightweight fleece is an easy layer when you want a little extra warmth. So go ahead, wear them year-round—that's what they're made for!",
  list_price: 50,
  sale_price: nil,
  article_number: "FD3012-126",
  division: "Kids",
  category: "Clothing",
  sub_category: "Bottoms"
)

puts "Creating cart items..."

CartItem.create!(
  product_id: 1,
  size: "9.5",
  quantity: 2,
  user_id: 1,
  checked_out: false
)

CartItem.create!(
  product_id: 2,
  size: "10.5",
  quantity: 3,
  user_id: 1,
  checked_out: false
)

CartItem.create!(
  product_id: 3,
  size: "10.5",
  quantity: 3,
  user_id: 2,
  checked_out: false
)



Product.first(3).each do |product|
  i = 1
  while i < 5 do
    begin
      photo_url = "https://sike-seeds.s3.amazonaws.com/#{product.article_number}/#{product.article_number}-#{i}.jpg"
      puts "Attaching image #{i} for product ##{product.id}"
      product.photos.attach(
        io: URI.open(photo_url),
        filename: "#{product.article_number}-#{i}.jpg"
      )
      i += 1
    rescue OpenURI::HTTPError => e
      puts "HTTP Error encountered: #{e.message}"
      break if e.message.include?('403 Forbidden')
    end
  end
end

  puts "Done!"
# end