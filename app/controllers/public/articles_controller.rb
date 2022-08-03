class Public::ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def show
  end 

  def index
    @articles = Article.all
  end

  def edit
  end
  
  def create
    article = Article.new(article_params)
    article.user_id = current_user.id
    if article.save
      redirect_to public_articles_path
    else
      @article = Article.new
      render :new
   end
  end
  
  def update
  end
  
  def destroy
  end
  
  private
   
   def article_params
    params.require(:article).permit(:store_image, :store_name, :store_comment, :rate_delicious, :rate_atmospher, :rate_cost)
   end
  
end
