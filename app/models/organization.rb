
class Organization < ApplicationRecord
  	has_one_attached :logo
	validates :name, presence: true, uniqueness: true
	validates :description, presence: true, length: { in: 100..200, wrong_length: "100 to 200 characters is allowed" }
	validates :zip_code, presence: true, format: { with: /\A(([0-8][0-9])|(9[0-5])|(2[ab]))[0-9]{3}\z/, message: "please enter a valid french zip code" }
	validates :location, presence: true
	validates :num_rna, presence: true, format: { with: /\A([W]([0-9]{9}))\z/, message: "please enter a valid french association num W+9nbs"}
	#validates :email, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }
  	has_one_attached :logo
  	has_many :follows
  	has_many :users, through: :follows
end
