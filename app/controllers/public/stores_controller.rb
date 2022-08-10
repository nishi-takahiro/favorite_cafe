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
    lat = '34.704649'
    lng = '135.499200'
    range = 1
    api = URI.parse("http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=#{ENV["HOTPEPPER_API_KEY"]}&lat=#{lat}&lng=#{lng}&range=#{range}&order=1&format=json")
    json = Net::HTTP.get(api)
    @result = JSON.parse(json)
    @result_data = JSON.parse(json, symbolize_names: true)
    @result_data1 = @result_data[:results][:shop]
  end

  def show
    @store = Store.find(params[:id])
  end
  
  def create
    @store = Store.new(store_params)
    if @store.save
      redirect_to public_stores_path
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
