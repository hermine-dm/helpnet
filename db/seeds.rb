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


puts "tout est détruit"

@user = User.create!(email: "admin_helpnet@yopmail.com",  password: "password", password_confirmation: "password", admin: true)
puts "admin créé"

10.times do 
	@fist_name = Faker::Name.first_name
	@user = User.create!(email: "#{@fist_name}@yopmail.com",  password: "password", password_confirmation: "password")
end
puts "users créés"


	association1 = Association.create!(name: "ARSLA", num_rna: "W000000000", description: "Première association en France à lutter sur tous les fronts
de la maladie de Charcot ou SLA, l'ARSLA oeuvre depuis toujours pour arriver un jour à son éradication.", location: "111 Rue de Reuilly,Paris", zip_code: "75012", website: "https://www.arsla.org/contact/", fb_website: "https://www.facebook.com/ARSLA.asso?fref=ts")
	association2 = Association.create!(name: "EspoirSLA", num_rna: "W343020413", description: "le projet principal est de participer à diffèrentes manifestations sportives afin de communiquer sur cette maladie orpheline encore méconnue du grand public.", location: "Montpellier", zip_code: "34000", email: "espoirsla@gmail.com", website: "https://www.espoirsla.com/", fb_website: "https://www.facebook.com/lacoursedelespoir/")
	association3 = Association.create!(name: "Espoir Charcot", num_rna: "W692005753", description: "L’association Espoir Charcot a 4 objectifs opérationnels: Donner un statut social à la maladie de Charcot à travers des évènements.Soutenir, aider et accompagner les malades dans leur quotidien. Soutenir, aider et accompagner les « aidants familiaux » pendant et après la maladie de leur proche. Soutenir les chercheurs et collecter des fonds pour la recherche fondamentale et clinique.", location: "161 Route de Pouilly,LIERGUES", zip_code: "69400", website: "http://www.espoircharcot.org/", fb_website: "https://www.facebook.com/EspoirCharcot")

puts "associations créées"