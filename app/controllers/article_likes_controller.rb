class ArticleLikesController < ApplicationController
	before_action :authenticate_user, only: [:create, :destroy]
	def create
		@article=Article.find(params[:article_id])
		@like=ArticleLike.create(user_id:current_user.id, article_id:@article.id)
		redirect_back(fallback_location: article_path(@article.id))
	end
	def destroy
		@article=Article.find(params[:article_id])
		@like=@article.article_likes.find(params[:id])
		@like.delete
		redirect_back(fallback_location: article_path(params[:article_id]))
	end
end
