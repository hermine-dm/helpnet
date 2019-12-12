class Article < ApplicationRecord
	validates :title, presence: true
	validates :content, presence: true
	belongs_to :user
	has_many :article_likes
	has_many :article_comments
	has_one_attached :illustration
	after_create :new_publication_send

	def new_publication_send
		@organization = User.find(self.user_id).organization
		@organization.followers.each do |follower|
    		UserMailer.new_publication_email(follower,@organization,self).deliver_now
    	end
  	end
end
