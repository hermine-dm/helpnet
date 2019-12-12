module ArticlesHelper
	def authenticate_author_or_admin #the author of the article or admin
  		@article = Article.friendly.find_by_slug(params[:slug])
  		unless current_user && (current_user.id == @article.user_id || current_user.admin == true)
	    	redirect_to root_path
  		end
  	end
  	def authenticate_canbeauthor_or_admin #the author of the article or admin
  		unless current_user && (current_user.organization.nil? == false || current_user.admin == true)
	    	redirect_to root_path
  		end
  	end
end
