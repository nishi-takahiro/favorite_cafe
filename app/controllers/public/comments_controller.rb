class Public::CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @article = Article.find(params[:article_id])
    #アーティクルがストアにネストしており、アーティクルからストアの情報をがとれるのでstore.idをとるための準備
    @store = @article.store
    @comment = current_user.comments.new(comment_params)
    @comment.article_id = @article.id
    @comment.save
    redirect_to public_store_article_path(@store.id, params[:article_id] )
  end

  def destroy
    @article = Article.find(params[:article_id])
    @store = @article.store
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to public_store_article_path(@store.id, params[:article_id] )
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
