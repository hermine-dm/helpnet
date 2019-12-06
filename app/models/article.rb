class Article < ApplicationRecord
	belongs_to :user
	has_many :article_likes
	has_many :article_comments
end
