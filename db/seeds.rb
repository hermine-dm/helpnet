# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
DatabaseCleaner.allow_production = true  
DatabaseCleaner.allow_remote_database_url = true
#-------------------------------------------
DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

#require 'thredded/database_seeder'
#Thredded::DatabaseSeeder.run

puts "tout est détruit"

@user = User.create!(email: "admin_helpnet@yopmail.com",  password: "password", password_confirmation: "password", admin: true)

10.times do 
	@fist_name = Faker::Name.first_name
	@user = User.create!(email: "#{@fist_name}@yopmail.com",  password: "password", password_confirmation: "password")
end
puts "users créés"