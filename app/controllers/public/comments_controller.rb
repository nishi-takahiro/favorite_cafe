class Public::CommentsController < ApplicationController
    
  def create
    @article = Article.find(params[:article_id])
    @store = @article.store
    @comment = current_user.comments.new(comment_params)
    @comment.article_id = @article.id
    @comment.save
    redirect_to public_store_article_path(@store.id, params[:article_id] )
  end
  
  def destroy
    @article = Article.find(params[:article_id])
    @store = @article.store
    @comment = Comment.find_by(user_id: current_user.id, article_id: params[:article_id])
    @comment.destroy
    redirect_to public_store_article_path(@store.id, params[:article_id] )
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
