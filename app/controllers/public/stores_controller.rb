class Public::StoresController < ApplicationController
  before_action :authenticate_user!
  
  require 'net/http'
  require 'uri'
  require 'json'
 

  def new
   @store = Store.new
  end

  def show
    @store = Store.find(params[:id])
  end
  
  def create
    @store = Store.new(store_params)
    if @store.save
      redirect_to new_public_store_article_path(@store)
    else
      render 'new'
    end
  end
  
  # binding.pry
  private
  
  def store_params
      params.require(:store).permit(:lat , :lng)
  end
  
end
