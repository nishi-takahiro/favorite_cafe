class Public::LikesController < ApplicationController

  def create
    @store = Article.find_by(params[:article_id]).store
    @article_like = Like.new(user_id: current_user.id, article_id: params[:article_id])
    @article_like.save
    redirect_to public_store_article_path(@store.id, params[:article_id] )
  end
  
  def destroy
    @store = Article.find_by(params[:article_id]).store
    @article_like = Like.find_by(user_id: current_user.id, article_id: params[:article_id])
    @article_like.destroy
    redirect_to public_store_article_path(@store.id, params[:article_id] )
  end

end
