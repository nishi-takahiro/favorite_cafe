class Public::StoresController < ApplicationController
  require 'net/http'
  require 'uri'
  require 'json'
 

  def new
   @store = Store.new
  end

  def edit
  end

  def index
  end

  def show
    @store = Store.find(params[:id])
  end
  
  def create
    @store = Store.new(store_params)
    if @store.save
      redirect_to new_public_article_path
    else
      @store = Store.new
      render 'new'
    end
  end
  
  # binding.pry
  private
  
  def store_params
      params.require(:store).permit(:lat , :lng)
  end
  
end
