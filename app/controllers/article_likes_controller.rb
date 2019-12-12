class ArticleLikesController < ApplicationController
	before_action :authenticate_user, only: [:create, :destroy]
	def create
		@article=Article.friendly.find_by_slug(params[:article_slug])
		@like=ArticleLike.create(user_id:current_user.id, article_id:@article.id)
		redirect_back(fallback_location: article_path(@article.slug))
	end
	def destroy
		@article=Article.friendly.find_by_slug(params[:article_slug])
		@like=@article.article_likes.find(params[:id])
		@like.delete
		redirect_back(fallback_location: article_path(params[:article_slug]))
	end
end
