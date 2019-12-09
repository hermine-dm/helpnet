class Article < ApplicationRecord
	validates :title, presence: true
	validates :content, presence: true
	belongs_to :user
	has_many :article_likes
	has_many :article_comments
	has_one_attached :illustration
end
