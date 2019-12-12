class ArticleLikesController < ApplicationController
	before_action :authenticate_user, only: [:create, :destroy]
	
	def create
		@article = Article.find(params[:article_id])
		@like = ArticleLike.create(user_id:current_user.id, article_id:@article.id)
		respond_to do |format|
        	format.html { redirect_back(fallback_location: article_path(@article.id))}
        	format.js { }
      	end
	end

	def destroy
		@article = Article.find(params[:article_id])
		@like = @article.article_likes.find(params[:id])
		@like.delete
		respond_to do |format|
        	format.html { redirect_back(fallback_location: article_path(params[:article_id]))}
        	format.js { }
      	end
	end
end
