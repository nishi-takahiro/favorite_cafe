class Admin::ArticlesController < ApplicationController
  def show
     @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all.order(created_at: :desc).page(params[:page]).per(20)
  end
  
private
  def article_params
    params.require(:article).permit(:store_image, :store_name, :store_comment, :rate_delicious, :rate_atmospher, :rate_cost, :address)
  end
end
