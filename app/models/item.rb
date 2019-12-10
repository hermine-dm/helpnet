class Item < ApplicationRecord
	belons_to :organization
	has_many_attached :images
end
