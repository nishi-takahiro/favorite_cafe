class Public::SearchesController < ApplicationController
 before_action :authenticate_user!
    
 def search
  if params[:search].present?
     
   @range = params[:range]
    # binding.pry
   if @range == "Article"
    @article = Article.looks(params[:search], params[:word]).order(created_at: :desc)
   elsif @range == "User"
    @user = User.looks(params[:search], params[:word])
   end
     
  elsif params[:tag_id].present?
   @tag = Tag.find(params[:tag_id])
   articles = @tag.articles.order(created_at: :desc)
   @article = Kaminari.paginate_array(articles).page(params[:page]).per(10)
  else
  end
 end

end
