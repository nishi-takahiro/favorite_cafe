class Public::SearchesController < ApplicationController
    
def search
    @range = params[:range]
        
    if @range == "Tag"
      @tag = Tag.looks(params[:search], params[:word])
    else
      @article = Article.looks(params[:search], params[:word])
    end
end

end
