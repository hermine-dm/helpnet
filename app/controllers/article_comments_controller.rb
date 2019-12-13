# frozen_string_literal: true

class ArticleCommentsController < ApplicationController
  before_action :authenticate_user

  def new
    @article = Article.friendly.find_by_slug(params[:article_slug])
    @comment = ArticleComment.new
  end

  def create
    @article = Article.friendly.find_by_slug(params[:article_slug])
    @comment = ArticleComment.create(user_id: current_user.id, article_id: @article.id, content: params[:content])
    respond_to do |format|
      format.html { redirect_back(fallback_location: article_path(@article.slug)) }
      format.js {}
    end
  end

  def edit
    @article = Article.friendly.find_by_slug(params[:article_slug])
    @comment = @article.article_comments.find(params[:id])
    respond_to do |format|
      format.html {}
      format.js {}
    end
  end

  def update
    @article = Article.friendly.find_by_slug(params[:article_slug])
    @comment = @article.article_comments.find(params[:id])
    @comment.update(content: post_params[:content], article_id: @article.id)
    respond_to do |format|
      format.html { redirect_to article_path(@article.slug), notice: 'Le commentaire a été mis à jour.' }
      format.js {}
    end
  end

  def destroy
    @article = Article.friendly.find_by_slug(params[:article_slug])
    @comment = @article.article_comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to article_path(@article.slug), notice: 'Le commentaire a été supprimé.' }
      format.js {}
    end
   end

  private

  def post_params
    params.require(:article_comment).permit(:content, :article_id)
    end
end
