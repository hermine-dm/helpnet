class Address < ApplicationRecord
	validates :zip_code, presence: true, format: { with: /\A(([0-8][0-9])|(9[0-5])|(2[ab]))[0-9]{3}\z/, message: "please enter a valid french zip code" }
	has_many :events

	def google_format
		@address="#{self.number}+#{self.street}+#{self.zip_code}+#{self.city}+France"
		return @address.tr(" ","")
	end
end
