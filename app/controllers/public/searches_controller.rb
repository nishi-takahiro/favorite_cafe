class Public::SearchesController < ApplicationController
    
def search
  @range = params[:range]
    
  if @range == "Article"
   @article = Article.looks(params[:search], params[:word])
  else
   @user = User.looks(params[:search], params[:word])
  end
end

end
