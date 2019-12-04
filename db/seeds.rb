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
	@user = User.create!(email: "#{@fist_name}#{rand(0..20)}@yopmail.com",  password: "password", password_confirmation: "password", created_at: Faker::Date.between(from: 15.days.ago, to: Date.today), last_sign_in_at: Faker::Date.between(from: 15.days.ago, to: Date.today))
end
puts "users créés"


	association1 = Association.create!(name: "ARSLA", num_rna: "W000000000", 
		description: "Première association en France à lutter sur tous les fronts de la maladie de Charcot ou SLA, l'ARSLA oeuvre depuis toujours pour arriver un jour à son éradication.", 
		location: "111 Rue de Reuilly,Paris", zip_code: "75012", website: "https://www.arsla.org/contact/", fb_website: "https://www.facebook.com/ARSLA.asso?fref=ts", phone: "0143389911", donate_link: "https://don.arsla.org/", 
		content: "
				L’association est née d’une démarche conjointe entre un jeune patient et son neurologue face à une situation d’urgence : une urgence d’information, une urgence de traitements, une urgence de meilleurs diagnostics, une urgence de meilleure prise en charge et une urgence de recherche de financements. Il y avait ce désespoir de la part de patients atteints d’une maladie contre laquelle on ne pouvait rien. Nous devions être soudés pour trouver au plus vite des solutions. 30 ans plus tard, cela est encore une réalité, une nécessité.
				L’ARSLA est une association nationale pour les patients et leurs proches

				Le défi permanent de l’ARSLA, sur tout le territoire français, est de répondre à l’évolution des besoins des malades pour favoriser l’accès aux soins, pour améliorer leur qualité de vie et celle de leurs proches ainsi que répondre aux insuffisances des pouvoirs publics par le plaidoyer politique ou la mobilisation financière.
				La recherche est la priorité de l’association depuis toujours et le restera

				L’ARSLA apporte un soutien global à la recherche dans le but de stimuler la capacité d’innovation des chercheurs et leur donner la liberté d’ouvrir de nouvelles voies dans tous les domaines de la recherche : clinique, fondamentale, génétique, sciences humaines…

				A l’occasion de ces 30 ans, l’association a mené un travail de réflexion stratégique qui a abouti à la rédaction d’un plan stratégique à 5 ans : « CHALLENGE 2020 ».

				Les grandes lignes de ce plan consistent à renforcer nos actions sur les axes suivant :

				    Défense des droits des malades
				    Amélioration de la qualité de vie des patients et des aidants
				    Promotion et accélération de la recherche
				https://www.youtube.com/watch?v=rLtkR-Zm-4E",
				logo_url: "https://www.arsla.org/wp-content/themes/arsla/images/logo.png")
	association2 = Association.create!(name: "Espoir SLA", num_rna: "W343020413", 
		description: "le projet principal est de participer à diffèrentes manifestations sportives afin de communiquer sur cette maladie orpheline encore méconnue du grand public.", 
		location: "Montpellier", zip_code: "34000", email: "espoirsla@gmail.com", website: "https://www.espoirsla.com/", fb_website: "https://www.facebook.com/lacoursedelespoir/", phone: "01........", donate_link: "https://www.espoirsla.com/faire-un-don", 
		content: "Récemment, nous avons appris que notre père était atteint d'une maladie du motoneurone type SLA (Sclérose Latérale Amyotrophique), une maladie qui touche 1 personne sur 25 000. 
				Pour l'heure, il n'y a aucun remède pour vaincre cette maladie.
				Loin de baisser les bras, nous avons décidé de nous battre en nous mobilisant dans plusieurs projets.	​
				Pour commencer, le projet principal est de participer à diffèrentes manifestations sportives afin de communiquer sur cette maladie orpheline encore méconnue du grand public.		​
				A chaque évènement, des équipes aux couleurs d'ESPOIR SLA seront constituées afin de sensibiliser le plus grand nombre.		​
				Nous créons des événements ESPOIR SLA pour rassembler un maximum de personnes pour véhiculer cette valeur d'entraide et de force de chacun . 			​
				De plus, accompagné de mes frères, nous avons créé une gamme de vêtements civils et sportifs dans le but de collecter des fonds pour aider notre père, David.			​
				Nous essayons d'aider la recherche , plus particulièrement la fondation Thierry Latran , la seule fondation européenne dédiée à la SLA .
				Il est primordial de se mobiliser tous ensemble dans cette épreuve dramatique.	 
				Chacun de vos sourires nous donnera la force de vaincre cette maladie .
				La Famille ESPOIR SLA ",
		logo_url: "https://static.wixstatic.com/media/6fd0dc_11a5ce9a4ea24566a8ebbcf3314a20fd~mv2.png/v1/fill/w_164,h_139,al_c,q_80,usm_0.66_1.00_0.01/6fd0dc_11a5ce9a4ea24566a8ebbcf3314a20fd~mv2.webp")
	association3 = Association.create!(name: "Espoir Charcot", num_rna: "W692005753", 
		description: "L’association Espoir Charcot veut donner un statut social à la maladie, permettre aux personnes de s'informer et d'être accompagnées",content: "L’association Espoir Charcot a 4 objectifs opérationnels: Donner un statut social à la maladie de Charcot à travers des évènements.Soutenir, aider et accompagner les malades dans leur quotidien. Soutenir, aider et accompagner les « aidants familiaux » pendant et après la maladie de leur proche. Soutenir les chercheurs et collecter des fonds pour la recherche fondamentale et clinique.", 
		location: "161 Route de Pouilly,LIERGUES", zip_code: "69400", website: "http://www.espoircharcot.org/", fb_website: "https://www.facebook.com/EspoirCharcot", phone: "0680513937", donate_link: "http://www.espoircharcot.org/donner/", logo_url: "http://www.espoircharcot.org/wp-content/uploads/2015/03/Espoir-typo-orange-e1428756860575.jpg")
	association4 = Association.create!(name: "Momone Extrême", num_rna: "W692005753", 
		description: "L’association Momone Extrême a pour objectif de soutenir la recherche sur la maladie de Charcot, par le biais de projets sportifs insolites.", email: "association.momone.extreme@gmail.com",
		content: "Parcourir 704 km, sur la route des grandes Alpes, en poussant une brouette chargée de ses affaires de voyage : voilà le défi que s’est lancé Vincent Monnerie.
			Ce Lochois de 26 ans aime les défis sportifs et les voyages, mais c’est avec un objectif tout particulier qu’il s’élancera, avec sa brouette, le 15 juillet prochain.  » Je voudrais faire connaître la maladie de Charcot et récolter des fonds qui serviront la recherche qui la concerne. Cette maladie a causé la mort de mon père le 25 mai dernier, moins d’un an après avoir été diagnostiqué « , explique le jeune homme, d’une voix qui laisse percevoir un mental d’acier. Son père, Philippe Monnerie, dirigeait l’entreprise Juhel à Loches, spécialisée dans le transport routier de fret de proximité. Applicateur d’enrobés de profession, Vincent Monnerie n’a pas cherché longtemps le moyen de transporter facilement son minimum vital lors de son périple à travers les Alpes. Ce sera une brouette ! Le véhicule avec lequel il est le plus à l’aise, puisque c’est son outil de travail. Un véhicule qui fait travailler « tous les muscles du corps », mais dont le maniement pourrait s’avérer scabreux dans la descente de l’un des 21 cols à franchir. Pas de quoi faire reculer le Lochois de 26 ans, qui a hérité de son père Philippe, décédé en mai dernier de la maladie de Charcot, un an après avoir été diagnostiqué, le goût de l’effort, des voyages, et de l’engagement pour les autres. Philippe a œuvré pour les plus démunis en Afrique, Vincent promet de soutenir « sur le long terme » la recherche sur la maladie de Charcot. https://youtu.be/KKx4VZp6WGU",
		location: "Sur les routes avec la brouette", zip_code: "75000", website: "https://associationmomoneextreme.wordpress.com/", fb_website: "https://www.facebook.com/elviajeroencarretilla/", phone: "0785543847", donate_link: "https://www.helloasso.com/associations/momone-extreme/formulaires/1?fbclid=IwAR01xed06N89XYM6Pd-I2HvQyBfj0CYW8tt-1IvVcLzszrbTY9zgivS1ZCk", logo_url: "https://scontent-cdg2-1.xx.fbcdn.net/v/t1.0-9/36347132_2065484783715532_9133833453475725312_n.jpg?_nc_cat=111&_nc_ohc=sSA126E2_jIAQkaFIQkZbG7fil0gF17F7jREPu0wDR5OpjZDjPn8BDZEw&_nc_ht=scontent-cdg2-1.xx&oh=366784a7340dd764a8191eb7f90f104b&oe=5E6DCB8A")
puts "associations créées"