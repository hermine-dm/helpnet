class ArticleCommentsController < ApplicationController
	before_action :authenticate_user
	def create
		@article=Article.find(params[:article_id])
		@comment=ArticleComment.create(user_id:current_user.id, article_id:@article.id, content: params[:content])
		redirect_back(fallback_location: article_path(@article.id))
	end
end
