class Follow < ApplicationRecord
	belongs_to :user
	belongs_to :assoc, class_name: "Association"
end
