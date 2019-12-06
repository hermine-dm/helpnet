class ArticlesController < ApplicationController
	def new
	end
	def show
		@article=Article.find(params[:id])
		@user=User.find(@article.user_id)
		@comments=@article.article_comments
	end
	def index
		@articles=Article.all
	end
	def create
	end
	def edit
	end
	def update
	end
	def destroy
	end
end
