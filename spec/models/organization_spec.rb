# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Organization, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  before(:each) do
    @user = User.create(first_name: 'John', last_name: 'Doe', name: 'Johndoe', email: 'test@yopmail.com', password: 'password', password_confirmation: 'password')
    @organization = Organization.create!(name: 'Espoir SLA', num_rna: 'W343020413',
                                         description: 'Le projet principal est de participer à diffèrentes manifestations sportives afin de communiquer sur cette maladie orpheline encore méconnue du grand public.',
                                         location: 'Montpellier', zip_code: '34000', email: 'espoirsla@gmail.com', website: 'https://www.espoirsla.com/', fb_website: 'https://www.facebook.com/lacoursedelespoir/', phone: '01........', donate_link: 'https://www.espoirsla.com/faire-un-don',
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
  			La Famille ESPOIR SLA ", user: @user)
  end

  context 'validation' do
    it 'is valid with valid attributes' do
      expect(@organization).to be_a(Organization)
      expect(@organization).to be_valid
    end

    describe '#num_rna' do
      it 'should not be valid without an num_rna' do
        bad_orga = Organization.create(name: 'Espoir SLA',
                                       description: 'Le projet principal est de participer à diffèrentes manifestations sportives afin de communiquer sur cette maladie orpheline encore méconnue du grand public.',
                                       location: 'Montpellier', zip_code: '34000', email: 'espoirsla@gmail.com', website: 'https://www.espoirsla.com/', fb_website: 'https://www.facebook.com/lacoursedelespoir/', phone: '01........', donate_link: 'https://www.espoirsla.com/faire-un-don',
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
				La Famille ESPOIR SLA ", user: @user)
        expect(bad_orga).not_to be_valid
        expect(bad_orga.errors.include?(:num_rna)).to eq(true)
      end
    end

    describe '#name' do
      it 'should not be valid without name' do
        bad_orga = Organization.create(num_rna: 'W343020413',
                                       description: 'Le projet principal est de participer à diffèrentes manifestations sportives afin de communiquer sur cette maladie orpheline encore méconnue du grand public.',
                                       location: 'Montpellier', zip_code: '34000', email: 'espoirsla@gmail.com', website: 'https://www.espoirsla.com/', fb_website: 'https://www.facebook.com/lacoursedelespoir/', phone: '01........', donate_link: 'https://www.espoirsla.com/faire-un-don',
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
				La Famille ESPOIR SLA ", user: @user)
        expect(bad_orga).not_to be_valid
        expect(bad_orga.errors.include?(:name)).to eq(true)
      end
    end
  end

  context 'associations' do
    describe 'events' do
      it 'should have_many events' do
        @address = Address.create(number: rand(1..15), street: "rue du #{['Général', 'Maréchal', ''].sample} #{Faker::Name.last_name}", zip_code: "#{rand(0..9)}#{rand(0..5)}#{rand(0..9)}#{rand(0..9)}#{rand(0..9)}")
        @event = Event.create(organization_id: @organization.id, start_date: Faker::Date.forward(days: 50), description: ['un super nouvel évènement sportif pour faire parler de la maladie, participez ! ou faites tourner', "retrouvons nous pour échanger autour #{["d'un verre", "d'un déjeuner", "d'un diner", "d'un gouter"].sample}", "Soutenons #{Faker::Name.first_name} pour son évènement et sa campagne, partageons sa page", "Faisons parler de la maladie grâce à cette nouvelle campagne 'virale'", 'Evènement spécial accompagnants', 'Evenements spécial malades', 'Evenements pour tous !!'].sample.capitalize, title: ['Repas des amis', 'Course solidaire', 'Support entre sportifs', 'Meetingpot', 'Sortie Foot', 'Voyage Accompagnants Malades', 'Week end pour les malades', 'Soirée festive', 'Débat', 'Manisfestation pour les malades', 'RDV des accompagnants', 'Prise de Parole'].sample, address_id: Address.all.sample.id)
        expect(@organization.events.include?(@event)).to eq(true)
      end
    end
  end

  context 'public instance methods' do
    describe '#zip_code' do
      it 'should return a string' do
        expect(@organization.zip_code).to be_a(String)
      end
    end
  end
end
