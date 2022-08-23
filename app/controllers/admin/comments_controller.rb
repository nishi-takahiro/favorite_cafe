class Admin::CommentsController < ApplicationController
   def destroy
    @article = Article.find(params[:article_id])
    @store = @article.store
    @comment = Comment.find_by(article_id: params[:article_id])
    @comment.destroy
    redirect_to admin_article_path(@store.id, params[:article_id] )
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end