class ArticleCommentsController < ApplicationController
	before_action :authenticate_user
	
	def create
		@article=Article.find(params[:article_id])
		@comment=ArticleComment.create(user_id:current_user.id, article_id:@article.id, content: params[:content])
		redirect_back(fallback_location: article_path(@article.id))
	end

	def edit
  	@article=Article.find(params[:article_id])
  	@comment = @article.article_comments.find(params[:id])
    respond_to do |format|
      format.html { }
      format.js { }
    end
  end

  def update
  	@article=Article.find(params[:article_id])
  	@comment = @article.article_comments.find(params[:id])
  	if @comment.update(content: post_params[:content], article_id: @article.id)
  		redirect_to article_path(@article), notice: 'Le commentaire a été mis à jour.'
  	else
  		flash.now[:alert] = "Loupé !"
  		render :edit
  	end
  end

  	def destroy
  		@article = Article.find(params[:article_id])
  		@comment = @article.article_comments.find(params[:id])
  		@comment.destroy
  		redirect_to article_path(@article.id), notice: 'Le commentaire a été supprimé.'
  	end

  	private

  		def post_params
      		params.require(:article_comment).permit(:content, :article_id)
    	end

end
