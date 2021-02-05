# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'

josette_pic = URI.open('https://res.cloudinary.com/dmk3a7sdb/image/upload/v1612454971/josette-zimmermann.jpg')
jared_pic = URI.open('https://images.pexels.com/photos/1157395/pexels-photo-1157395.jpeg?cs=srgb&dl=pexels-josh-willink-1157395.jpg&fm=jpg')
theo_pic = URI.open('https://images.pexels.com/photos/1484794/pexels-photo-1484794.jpeg?cs=srgb&dl=pexels-jimmy-jimmy-1484794.jpg&fm=jpg')
taro_pic = URI.open('https://images.pexels.com/photos/937481/pexels-photo-937481.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500')
arisa_pic = URI.open('https://images.pexels.com/photos/4350172/pexels-photo-4350172.jpeg?cs=srgb&dl=pexels-ketut-subiyanto-4350172.jpg&fm=jpg')
kyoko_pic = URI.open('https://res.cloudinary.com/dmk3a7sdb/image/upload/v1612443813/imkudqdgw3lp4n47bzv3lp0xty6n.jpg')
marleen_pic = URI.open('https://images.pexels.com/photos/2050994/pexels-photo-2050994.jpeg?cs=srgb&dl=pexels-edu-carvalho-2050994.jpg&fm=jpg')
coaching_pic = URI.open('https://images.pexels.com/photos/1661950/pexels-photo-1661950.jpeg?cs=srgb&dl=pexels-steshka-willems-1661950.jpg&fm=jpg')
cooking_pic = URI.open('https://images.pexels.com/photos/12190/christmas-cookies-553457.jpg?cs=srgb&dl=pexels-pixabay-12190.jpg&fm=jpg')
tutoring_pic = URI.open('https://images.pexels.com/photos/4778676/pexels-photo-4778676.jpeg?cs=srgb&dl=pexels-cottonbro-4778676.jpg&fm=jpg')
ikebana_pic = URI.open('https://images.pexels.com/photos/5706061/pexels-photo-5706061.jpeg?cs=srgb&dl=pexels-karolina-grabowska-5706061.jpg&fm=jpg')
piano_pic = URI.open('https://images.pexels.com/photos/210764/pexels-photo-210764.jpeg?cs=srgb&dl=pexels-pixabay-210764.jpg&fm=jpg')

puts "Cleaning database..."
User.destroy_all
Listing.destroy_all
Booking.destroy_all

CITIES = %w(Asakusa Shibuya Minato Aoyama Ginza Harajuku Kinshicho Nagatacho)

puts "Start seeding clients..."
josette = User.new(
    first_name: "Josette",
    last_name: "Zimmermann",
    email: Faker::Internet.email,
    password: "test123",
    phone_number: '0123456789',
    description: "I am a mother of a usually highly energetic 12-year-old boy and a sweet 7-year-old girl. Before the emergency state declaration, my husband and I could barely manage to entertain them with weekend activities. A few months in with schools closed and we are now running out of things to engage them with. Looking forward to getting help and inspiration from ShareCare!",
    age_range: User::AGE_RANGE[3]
  )
  josette.photo.attach(io: josette_pic, filename: 'josette.jpg', content_type: 'image/jpg')
  josette.save
  puts "created client named #{josette.first_name} with id #{josette.id}"

jared = User.new(
  first_name: "Jared",
  last_name: "Blanchet",
  email: Faker::Internet.email,
  password: "test123",
  phone_number: '08886789',
  description: "My little boy is usually quiet. I'm looking for a caregiver who could help engage and bring my son out of his shell with fun outdoors activities",
  age_range: User::AGE_RANGE[2]
)
jared.photo.attach(io: jared_pic, filename: 'jared.jpg', content_type: 'image/jpg')
jared.save
puts "created client named #{jared.first_name} with id #{jared.id}"

puts "Start seeding caregivers..."
theo = User.new(
    first_name: "Theo",
    last_name: "Muller",
    email: Faker::Internet.email,
    password: "test123",
    phone_number: '0123456789',
    description: "I was a varsity baseball player in high school. Now, I'm studying physical education at university. I can help your child level up while having fun. Don't strike out—book a time today! Available: Monday to Wednesday.",
    age_range: User::AGE_RANGE[0]
  )
  theo.photo.attach(io: theo_pic, filename: 'theo.jpg', content_type: 'image/jpg')
  theo.save
  puts "created caregiver named #{theo.first_name} with id #{theo.id}"
  
  coaching = Listing.new(
    location: CITIES.sample,
    fee: rand(1000..3000),
    service_description: "I was a varsity baseball player in high school. Now, I'm studying physical education at university. I can help your child level up while having fun. Don't strike out—book a time today! Available: Monday to Wednesday.",
    title: "All-Star Coaching"
  )
  coaching.photo.attach(io: coaching_pic, filename: 'coaching.jpg', content_type: 'image/jpg')
  coaching.user = theo
  coaching.save
  coaching.tag_list.add(%w(baseball sports outdoors PE monday tuesday wednesday))
  coaching.save

  puts "created a listing in #{coaching.location} by #{theo.first_name} at #{coaching.fee}JPY per hour"

  booking = Booking.new(
    start_date: DateTime.new(2021,2,3,4,5,6),
    end_date: DateTime.new(2021,2,3,4,5,6) + 1,
    status: Booking::STATUS[1]
  )
  booking.listing = coaching
  booking.user = jared
  booking.save
  puts "created a booking for client #{jared.first_name} by #{theo.first_name}"

taro = User.new(
    first_name: "Taro",
    last_name: "Tanaka",
    email: Faker::Internet.email,
    password: "test123",
    phone_number: '0123456789',
    description: "I studied cooking in France for 4 years. Cooking with my younger cousins is so much fun. I hope I can share the joy of cooking with your family, too! I will plan a recipe based on your booking time. My specialty is croissants. Please let me know if allergies are a concern. Available: Friday, Saturday, and Sunday afternoons.",
    age_range: User::AGE_RANGE[0]
  )
  taro.photo.attach(io: taro_pic, filename: 'taro.jpg', content_type: 'image/jpg')
  taro.save
  puts "created caregiver named #{taro.first_name} with id #{taro.id}"

  cooking = Listing.new(
    location: CITIES.sample,
    fee: rand(1000..3000),
    service_description: "I studied cooking in France for 4 years. Cooking with my younger cousins is so much fun. I hope I can share the joy of cooking with your family, too! I will plan a recipe based on your booking time. My specialty is croissants. Please let me know if allergies are a concern. Available: Friday, Saturday, and Sunday afternoons.",
    title: "Bon Appétit"
  )
  cooking.photo.attach(io: cooking_pic, filename: 'cooking.jpg', content_type: 'image/jpg')
  cooking.user = taro
  cooking.save
  cooking.tag_list.add(%w(baking french culinary cooking friday weekend afternoon))
  cooking.save

  puts "created a listing in #{cooking.location} by #{taro.first_name} at #{cooking.fee}JPY per hour"

  booking = Booking.new(
    start_date: DateTime.new(2021,3,4,5,6,7),
    end_date: DateTime.new(2021,3,4,5,6,7) + 1,
    status: Booking::STATUS[1]
  )
  booking.listing = cooking
  booking.user = josette
  booking.save
  puts "created a booking for client #{josette.first_name} by #{taro.first_name}"

arisa = User.new(
    first_name: "Arisa",
    last_name: "Yamato",
    email: Faker::Internet.email,
    password: "test123",
    phone_number: '0123456789',
    description: "I used to be a teacher, but I am taking some time off to raise my toddler. If your child is struggling with homework or preparing for exams, I am happy to provide one-on-one tutoring. Let me know about your learning goals. Available: Monday, Wednesday, Friday.",
    age_range: User::AGE_RANGE[2]
  )
  arisa.photo.attach(io: arisa_pic, filename: 'arisa.jpg', content_type: 'image/jpg')
  arisa.save
  puts "created caregiver named #{arisa.first_name} with id #{arisa.id}"

  tutoring = Listing.new(
    location: CITIES.sample,
    fee: rand(1000..3000),
    service_description: "I used to be a teacher, but I am taking some time off to raise my toddler. If your child is struggling with homework or preparing for exams, I am happy to provide one-on-one tutoring. Let me know about your learning goals. Available: Monday, Wednesday, Friday.",
    title: "A+ Tutoring"
  )
  tutoring.photo.attach(io: tutoring_pic, filename: 'tutoring.jpg', content_type: 'image/jpg')
  tutoring.user = arisa
  tutoring.save
  tutoring.tag_list.add(%w(math preschool trained-teacher literature monday wednesday friday))
  tutoring.save

  puts "created a listing in #{tutoring.location} by #{arisa.first_name} at #{tutoring.fee}JPY per hour"

  booking = Booking.new(
    start_date: DateTime.new(2021,3,7,8,0,0),
    end_date: DateTime.new(2021,3,7,8,0,0) + 1,
    status: Booking::STATUS[1]
  )
  booking.listing = tutoring
  booking.user = josette
  booking.save
  puts "created a booking for client #{josette.first_name} by #{arisa.first_name}"

kyoko = User.new(
    first_name: "Kyoko",
    last_name: "Esposito",
    email: Faker::Internet.email,
    password: "test123",
    phone_number: '066655889',
    description: "I was a professional ikebana teacher for 45 years. Now that I'm retired, I have too much time on my hands! I can teach your kids how to make a beautiful flower arrangement using seasonal flowers. If your child has allergies, we can use artificial flowers. Kids of all ages can enjoy this traditional art. Available by appointment.",
    age_range: User::AGE_RANGE[4]
  )
  kyoko.photo.attach(io: kyoko_pic, filename: 'kyoko.jpg', content_type: 'image/jpg')
  kyoko.save
  puts "created caregiver named #{kyoko.first_name} with id #{kyoko.id}"

  ikebana = Listing.new(
    location: CITIES.sample,
    fee: rand(1000..3000),
    service_description: "I was a professional ikebana teacher for 45 years. Now that I'm retired, I have too much time on my hands! I can teach your kids how to make a beautiful flower arrangement using seasonal flowers. If your child has allergies, we can use artificial flowers. Kids of all ages can enjoy this traditional art. Available by appointment.",
    title: "Blossoming Artist"
  )
  ikebana.photo.attach(io: ikebana_pic, filename: 'ikebana.jpg', content_type: 'image/jpg')
  ikebana.user = kyoko
  ikebana.save
  ikebana.tag_list.add(%w(art flower nature seasonal flexible weekend evening))
  ikebana.save

  puts "created a listing in #{ikebana.location} by #{kyoko.first_name} at #{ikebana.fee}JPY per hour"

  booking = Booking.new(
    start_date: DateTime.new(2021,3,7,8,0,0),
    end_date: DateTime.new(2021,3,7,8,0,0) + 1,
    status: Booking::STATUS[1]
  )
  booking.listing = ikebana
  booking.user = josette
  booking.save
  puts "created a booking for client #{josette.first_name} by #{kyoko.first_name}"

marleen = User.new(
    first_name: "Marleen",
    last_name: "Wortham",
    email: Faker::Internet.email,
    password: "test123",
    phone_number: '066986779',
    description: "Playing the piano is my passion. I started when I was 5 years old and was lucky enough to play with the Tokyo Symphony Orchestra for decades. Nothing brings me greater joy than sharing music. We can practice scales, simple songs, or work on technique. First-time Beethovens are welcome! Available in the afternoon and evening.",
    age_range: User::AGE_RANGE[4]
  )
  marleen.photo.attach(io: marleen_pic, filename: 'marleen.jpg', content_type: 'image/jpg')
  marleen.save
  puts "created caregiver named #{marleen.first_name} with id #{marleen.id}"

  piano = Listing.new(
    location: CITIES.sample,
    fee: rand(1000..3000),
    service_description: "Playing the piano is my passion. I started when I was 5 years old and was lucky enough to play with the Tokyo Symphony Orchestra for decades. Nothing brings me greater joy than sharing music. We can practice scales, simple songs, or work on technique. First-time Beethovens are welcome! Available in the afternoon and evening.",
    title: "Don't Fret"
  )
  piano.photo.attach(io: piano_pic, filename: 'piano.jpg', content_type: 'image/jpg')
  piano.user = marleen
  piano.save
  piano.tag_list.add(%w(art music piano instruments evening afternoon flexible))
  piano.save

  puts "created a listing in #{piano.location} by #{marleen.first_name} at #{piano.fee}JPY per hour"

  booking = Booking.new(
    start_date: DateTime.new(2021,3,7,8,0,0),
    end_date: DateTime.new(2021,3,7,8,0,0) + 1,
    status: Booking::STATUS[1]
  )
  booking.listing = piano
  booking.user = jared
  booking.save
  puts "created a booking for client #{jared.first_name} by #{marleen.first_name}"
