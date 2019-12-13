# frozen_string_literal: true

class Item < ApplicationRecord
  belongs_to :organization
  has_many_attached :images
end
