class ArticlesController < ApplicationController
	include ArticlesHelper
	before_action :authenticate_author_or_admin, only: [:edit, :update, :destroy]
	before_action :authenticate_canbeauthor_or_admin, only: [:new, :create]

	def new
		@article = Article.new
	end

	def show
		@article=Article.find(params[:id])
		@user=User.find(@article.user_id)
		@organization = User.find(@article.user_id).organization
		@comments=@article.article_comments
		@articles=Article.all.sample(3)

	end
	def index
		@articles=Article.all
	end
	def create
		@article=Article.new(user_id: current_user.id, title: params[:article][:title], content: params[:article][:content], illustration: params[:article][:illustration])
		if @article.save
			flash[:success] = "Article créé - Merci pour votre contribution!"
      		redirect_to article_path(@article.id)
    	else
		    flash.now[:error] = "Désolé il y a une erreur :#{@article.errors.full_messages.to_sentence}"
		    render :new
    	end
	end
	def edit
		@article=Article.find(params[:id])
		@user=User.find(@article.user_id)
	end

	def update
		@article = Article.find(params[:id])
    	post_params = params.require(:article).permit(:title, :content, :illustration)
	    if @article.update(post_params)
	      flash[:success] = "L'article a bien été mis à jour"
	      redirect_to article_path(@article.id)
	    else
	      flash[:error] = "Désolé il y a une erreur :#{@article.errors.full_messages.to_sentence}"
	      redirect_to edit_article_path(@article.id)
	    end
	end

	def destroy
		@article=Article.find(params[:id])
		@article.destroy
		flash[:success] = "L'article a été supprimé"
    	redirect_to articles_path
	end
end
