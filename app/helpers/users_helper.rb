module UsersHelper

	def user_address(user)
		if @user.address_id == nil
        	@address=Address.new
    	else
        	@address=Address.find(@user.address_id)
    	end
	end

	def user_liked_articles(user)
		@likes = current_user.article_likes.limit(3)
	    @articles = []
	    for like in @likes do
	      @articles << Article.find(like.article_id)
		end
	end

end
