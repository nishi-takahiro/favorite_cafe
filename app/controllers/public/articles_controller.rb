class Public::ArticlesController < ApplicationController
  def new
    @store = Store.find(params[:store_id])
    @article = @store.articles.new
  # お店を探すコード
    api = URI.parse("http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=#{ENV["HOTPEPPER_API_KEY"]}&lat=#{@store.lat}&lng=#{@store.lng}&range=1&order=1&format=json")
    json = Net::HTTP.get(api)
    @result = JSON.parse(json)
    @result_data = JSON.parse(json, symbolize_names: true)
    @result_data1 = @result_data[:results][:shop][0]
    @article.store_name = @result_data1[:name]
    @article.address = @result_data1[:address]
  end

  def show
    @store = Store.find(params[:store_id])
    @article = Article.find(params[:id])
    @tags = @article.tags.pluck(:tag).join(',')
  # コメント機能のための変数
    @comment = Comment.new
  end 

  def index
    @store = Store.find(params[:store_id])
    @articles = Article.all.page(params[:page]).per(15)
  end

  def edit
    @store = Store.find(params[:store_id])
    @article = Article.find(params[:id])
    @tags = @article.tags.pluck(:tag).join(',')
    
  end
  
  def create
    store = Store.find(params[:store_id])
    @article = current_user.articles.new(article_params)
    tags = params[:article][:tag].split(',')
    @article.store_id = store.id
    if @article.save
       @article.save_tags(tags)
         redirect_to  public_store_article_path([store], [@article])
    else
      @article = Article.new
      render :new
   end
  end
  
  def update
    store = Store.find(params[:store_id])
    @article = current_user.articles.find(params[:id])
    tags = params[:article][:tag].split(',')
    if @article.update(article_params)
       @article.update_tags(tags)
         redirect_to public_store_article_path([store], [@article])
    else
      render 'edit'
    end
  end
  
  def destroy
    article = Article.find(params[:id])
    article.destroy
    redirect_to  public_store_articles_path
  end
  
  private
   
   def article_params
    params.require(:article).permit(:store_image, :store_name, :store_comment, :rate_delicious, :rate_atmospher, :rate_cost, :address)
   end
  
end
