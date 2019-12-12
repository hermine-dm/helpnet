
class Organization < ApplicationRecord
  	has_one_attached :logo
	validates :name, presence: true, uniqueness: true
	validates :description, presence: true, length: { in: 100..200, wrong_length: "100 to 200 characters is allowed" }
	validates :num_rna, presence: true, format: { with: /\A([W]([0-9]{9}))\z/, message: "please enter a valid french association num W+9nbs"}
	#validates :email, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }
	belongs_to :user
  	belongs_to :address
	has_one_attached :logo
	has_many :follows
	has_many :users, through: :follows
	has_many :events
	has_many :items
	extend FriendlyId
  	friendly_id :name, use: :slugged
end
