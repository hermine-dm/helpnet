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
		@article=Article.new(user_id: current_user.id, title: params[:title], content: params[:content])
		if @article.save
			flash[:success] = "Article créé - Merci pour votre contribution!" 
      		redirect_to article_path(@article.id)
    	else
		    flash.now[:error] = "Désolé il y a une erreur :#{@article.errors.full_messages.to_sentence}"
		    render :new
    	end
	end
	def edit
	end
	def update
	end
	def destroy
	end
end
