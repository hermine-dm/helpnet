class Event < ApplicationRecord
	belongs_to :organization
	belongs_to :address
	has_one_attached :illustration
	validates :title, presence: true
	validates :start_date, presence: true
	validate :start_in_the_future
	validates :duration, presence: true, numericality: { only_integer: true, greater_than: 0 }
	validate :modulo_5

	def start_in_the_future
		if start_date.to_date < DateTime.now.to_date
			errors.add(:start_date, "L'évènement ne peut etre dans le passé")
		end
	end
	def modulo_5
		if duration % 5 != 0
			errors.add(:duration, "Doit être un multiple de 5 minutes")
		end
	end
end
