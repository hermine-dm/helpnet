class Association < ApplicationRecord
  	has_one_attached :logo
	validates :name, presence: true, uniqueness: true
	validates :description, presence: true
	validates :zip_code, presence: true, format: { with: /\A(([0-8][0-9])|(9[0-5])|(2[ab]))[0-9]{3}\z/, message: "please enter a valid french zip code" }
	validates :location, presence: true
	validates :num_rna, presence: true, format: { with: /\A([W]([0-9]{9}))\z/, message: "please enter a valid french association num W+9nbs"}
	#validates :email, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }
end
