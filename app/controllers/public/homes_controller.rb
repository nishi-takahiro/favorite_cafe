class Public::HomesController < ApplicationController
  def top
    
    @stores = Store.all
    @article = Store.find_by(params[:article_id])
  end

  def about
  end
end
