# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

client_photo = URI.open('https://res.cloudinary.com/dmk3a7sdb/image/upload/v1612282754/ntrj72adrz21phiydqze50jfam9n.jpg')
caregiver_photo = URI.open('https://res.cloudinary.com/dmk3a7sdb/image/upload/v1612282381/bk70if9cxumxjlq4ugvxj8ubaztm.jpg')

puts "Cleaning database..."
User.destroy_all
Listing.destroy_all
Booking.destroy_all

puts "Start seeding"
client = User.new(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
  password: "test123",
  age_range: User::AGE_RANGE.sample
)
client.photo.attach(io: client_photo, filename: 'client.jpg', content_type: 'image/jpg')
client.save
puts "created client named #{client.first_name} with id #{client.id}"

caregiver = User.new(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
  password: "test123",
  age_range: User::AGE_RANGE.sample
)
caregiver.photo.attach(io: caregiver_photo, filename: 'caregiver.jpg', content_type: 'image/jpg')
caregiver.save
puts "created caregiver named #{caregiver.first_name} with id #{caregiver.id}"

CITIES = %w(Asakusa Shibuya Minato Aoyama Ginza Harajuku Kinshicho Nagatacho)
TAGS = ['cooking', 'french', 'japanese', 'korean', 'guitar', 'painting', 'craft', '20 years playing tennis', 'outdoors', 'humor', 'globe trotter']

listing = Listing.new(
  location: CITIES.sample,
  fee: rand(10..25),
  service_description: Faker::Lorem.paragraph,
  title: Faker::Marketing.buzzwords
)
listing.user = caregiver
listing.save
listing.tag_list.add(TAGS.sample(5))
listing.save

puts "created a listing in #{listing.location} by #{caregiver.first_name} at #{listing.fee}$ per hour"

booking = Booking.new(
  start_date: DateTime.new(2021,2,3,4,5,6),
  end_date: DateTime.new(2021,2,3,4,5,6) + 1,
  status: Booking::STATUS.sample
)
booking.listing = listing
booking.user = client
booking.save
puts "created a booking for client #{client.first_name} by #{caregiver.first_name}"
