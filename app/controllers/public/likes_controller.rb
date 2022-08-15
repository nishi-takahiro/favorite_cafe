class Public::LikesController < ApplicationController

  def create
    # articleに紐づけられたstoreのデータをとってくる
    @store = Article.find_by(params[:article_id]).store
    @article_like = Like.new(user_id: current_user.id, article_id: params[:article_id])
    @article_like.save
    # store_idに@store.id、article_idにparams[article_id]
    redirect_to public_store_article_path(@store.id, params[:article_id] )
  end
  
  def destroy
    @store = Article.find_by(params[:article_id]).store
    @article_like = Like.find_by(user_id: current_user.id, article_id: params[:article_id])
    @article_like.destroy
    redirect_to public_store_article_path(@store.id, params[:article_id] )
  end

end
