class Public::ArticlesController < ApplicationController
  def new
    @store = Store.find(params[:store_id])
    @article = @store.articles.new
    api = URI.parse("http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=#{ENV["HOTPEPPER_API_KEY"]}&lat=#{@store.lat}&lng=#{@store.lng}&range=1&order=1&format=json")
    json = Net::HTTP.get(api)
    @result = JSON.parse(json)
    @result_data = JSON.parse(json, symbolize_names: true)
    @result_data1 = @result_data[:results][:shop][0]
    @article.store_name = @result_data1[:name]
    @article.address = @result_data1[:address]
  end

  def show
  end 

  def index
    @articles = Article.all
  end

  def edit
  end
  
  def create
    store = Store.find(params[:store_id])
    article = current_user.articles.new(article_params)
    article.store_id = store.id
    if article.save
      redirect_to public_users_my_page_path
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
    params.require(:article).permit(:store_image, :store_name, :store_comment, :rate_delicious, :rate_atmospher, :rate_cost, :address)
   end
  
end
