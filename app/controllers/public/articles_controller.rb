class Public::ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def new
    @store = Store.find(params[:store_id])
    @article = @store.articles.new
  # storeから送られてきたlat,lngをもとにお店を探すコード
    api = URI.parse("http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=#{ENV["HOTPEPPER_API_KEY"]}&lat=#{@store.lat}&lng=#{@store.lng}&range=1&order=1&format=json")
    json = Net::HTTP.get(api)
    @result = JSON.parse(json)
    @result_data = JSON.parse(json, symbolize_names: true)
    @result_data1 = @result_data[:results][:shop][0]
    # 店舗検索をかけた時に情報が取れない時は、再度検索をする
    if @result_data1.nil?
      redirect_to new_public_store_path, notice: "お店が見つかりませんでした。もう一度検索をしてください"
    else
      @article.store_name = @result_data1[:name]
      @article.address = @result_data1[:address]
   end
  end


  def show
    @store = Store.find(params[:store_id])
    @article = Article.find(params[:id])
    @tags = @article.tags.pluck(:tag).join(',')
  # コメント機能のための変数
    @comment = Comment.new
  end

  def index
    begin
      @articles = Article.all.order(created_at: :desc).page(params[:page]).per(20)
    rescue
     redirect_to new_public_store_path, notice: "新規投稿を作成してください。"
    end
  end

  def edit
    @store = Store.find(params[:store_id])
    @article = Article.find(params[:id])
    @tags = @article.tags.pluck(:tag).join(',')

  end

  def create
    store = Store.find(params[:store_id])
    @article = current_user.articles.new(article_params)
    tags = params[:article][:tag].split(/[、|,|，]/)
    @article.store_id = store.id
    if @article.save
       if @article.save_tags(tags)
         redirect_to  public_store_article_path([store], [@article])
        else
         redirect_to new_public_store_article_path, notice: "タグ1つに50文字以下の入力です。"
        end
    else
       render 'new'
   end
  end

  def update
    @store = Store.find(params[:store_id])
    @article = current_user.articles.find(params[:id])
    tags = params[:article][:tag].split(/[、|,|，]/)
    if @article.update(article_params)
       @article.save_tags(tags)
         redirect_to public_store_article_path([@store], [@article])
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
