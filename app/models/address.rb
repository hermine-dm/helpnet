class Address < ApplicationRecord
	validates :zip_code, format: { with: /\A(([0-8][0-9])|(9[0-5])|(2[ab]))[0-9]{3}\z/, message: "please enter a valid french zip code" }, on: :update, if: Proc.new { |u| u.zip_code.present? }
	has_many :events
	has_many :users
	has_many :organizations

	def numberandstreet
		if self.number != nil
			@address="#{self.number}, #{self.street}"
		else 
			@address="#{self.street}"
		end
		return @address
	end
	def zip_codeandcity
		return @address="#{self.zip_code} #{self.city}"
	end
	def google_format
		@address="#{self.number}+#{self.street}+#{self.zip_code}+#{self.city}+France"
		return @address.tr(" ","")
	end
end
