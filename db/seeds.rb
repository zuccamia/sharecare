# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning database..."
User.destroy_all
Listing.destroy_all
Booking.destroy_all

CITIES = %w(Asakusa Shibuya Minato Aoyama Ginza Harajuku Kinshicho Nagatacho)

puts "Start seeding..."
josette = User.new(
    first_name: "Josette",
    last_name: "Zimmermann",
    email: Faker::Internet.email,
    password: "test123",
    phone_number: '0123456789',
    description: "I am a mother of a usually highly energetic 12-year-old boy and a sweet 7-year-old girl. Before the emergency state declaration, my husband and I could barely manage to entertain them with weekend activities. A few months in with schools closed and we are now running out of things to engage them with. Looking forward to getting help and inspiration from ShareCare!",
    age_range: User::AGE_RANGE[2]
  )
  josette.save
  puts "created client named #{josette.first_name} with id #{josette.id}"

theo = User.new(
    first_name: "Theo",
    last_name: "Muller",
    email: Faker::Internet.email,
    password: "test123",
    phone_number: '0123456789',
    description: "I was a varsity baseball player in high school. Now, I'm studying physical education at university. I can help your child level up while having fun. Don't strike out—book a time today! Available: Monday to Wednesday.",
    age_range: User::AGE_RANGE[0]
  )
  theo.save
  puts "created caregiver named #{theo.first_name} with id #{theo.id}"
  
  coaching = Listing.new(
    location: CITIES.sample,
    fee: rand(1000..3000),
    service_description: "I was a varsity baseball player in high school. Now, I'm studying physical education at university. I can help your child level up while having fun. Don't strike out—book a time today! Available: Monday to Wednesday.",
    title: "All-Star Coaching"
  )
  coaching.user = theo
  coaching.save
  coaching.tag_list.add(%w(baseball sports outdoors PE))
  coaching.save

  puts "created a listing in #{coaching.location} by #{theo.first_name} at #{coaching.fee}JPY per hour"

  booking = Booking.new(
    start_date: DateTime.new(2021,2,3,4,5,6),
    end_date: DateTime.new(2021,2,3,4,5,6) + 1,
    status: Booking::STATUS[1]
  )
  booking.listing = coaching
  booking.user = josette
  booking.save
  puts "created a booking for client #{josette.first_name} by #{theo.first_name}"

taro = User.new(
    first_name: "Taro",
    last_name: "Tanaka",
    email: Faker::Internet.email,
    password: "test123",
    phone_number: '0123456789',
    description: "I studied cooking in France for 4 years. Cooking with my younger cousins is so much fun. I hope I can share the joy of cooking with your family, too! I will plan a recipe based on your booking time. My specialty is croissants. Please let me know if allergies are a concern. Available: Friday, Saturday, and Sunday afternoons.",
    age_range: User::AGE_RANGE[0]
  )
  taro.save
  puts "created caregiver named #{taro.first_name} with id #{taro.id}"

  cooking = Listing.new(
    location: CITIES.sample,
    fee: rand(1000..3000),
    service_description: "I studied cooking in France for 4 years. Cooking with my younger cousins is so much fun. I hope I can share the joy of cooking with your family, too! I will plan a recipe based on your booking time. My specialty is croissants. Please let me know if allergies are a concern. Available: Friday, Saturday, and Sunday afternoons.",
    title: "Bon Appétit"
  )
  cooking.user = taro
  cooking.save
  cooking.tag_list.add(%w(baking french culinary cooking))
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
  arisa.save
  puts "created caregiver named #{arisa.first_name} with id #{arisa.id}"

  tutoring = Listing.new(
    location: CITIES.sample,
    fee: rand(1000..3000),
    service_description: "I used to be a teacher, but I am taking some time off to raise my toddler. If your child is struggling with homework or preparing for exams, I am happy to provide one-on-one tutoring. Let me know about your learning goals. Available: Monday, Wednesday, Friday.",
    title: "A+ Tutoring"
  )
  tutoring.user = arisa
  tutoring.save
  tutoring.tag_list.add(%w(math preschool trained-teacher literature))
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
