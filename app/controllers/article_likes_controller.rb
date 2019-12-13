# frozen_string_literal: true

class ArticleLikesController < ApplicationController
  before_action :authenticate_user, only: %i[create destroy]

  def create
    @article = Article.friendly.find_by_slug(params[:article_slug])
    @like = ArticleLike.create(user_id: current_user.id, article_id: @article.id)
    respond_to do |format|
      format.html { redirect_back(fallback_location: article_path(@article.slug)) }
      format.js {}
    end
  end

  def destroy
    @article = Article.friendly.find_by_slug(params[:article_slug])
    @like = @article.article_likes.find(params[:id])
    @like.delete
    respond_to do |format|
      format.html { redirect_back(fallback_location: article_path(@article.slug)) }
      format.js {}
    end
  end
end
