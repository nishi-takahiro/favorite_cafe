class Admin::CommentsController < ApplicationController
   before_action :authenticate_admin!

   def destroy
    @article = Article.find(params[:article_id])
    @store = @article.store
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to admin_article_path(params[:article_id] )
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end