class Public::StoresController < ApplicationController
  require 'net/http'
  require 'uri'
  require 'json'
  def search
    key = "9d0e3bd839c5a4d3"
    lat = '35.658'
    lng = '139.7016'
    range = 1
    api = URI.parse("http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=#{key}&lat=#{lat}&lng=#{lng}&range=#{range}&order=1&format=json")
    json = Net::HTTP.get(api)
    @result = JSON.parse(json)    
  end

  def new
    key = "9d0e3bd839c5a4d3"
    lat = '35.658'
    lng = '139.7016'
    range = 1
    api = URI.parse("http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=#{key}&lat=#{lat}&lng=#{lng}&range=#{range}&order=1&format=json")
    json = Net::HTTP.get(api)
    @result = JSON.parse(json)    
  end

  def edit
  end

  def index
    key = "9d0e3bd839c5a4d3"
    lat = '34.704649'
    lng = '135.499200'

    range = 1
    api = URI.parse("http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=#{key}&lat=#{lat}&lng=#{lng}&range=#{range}&order=1&format=json")
    json = Net::HTTP.get(api)
    @result = JSON.parse(json)
    @result_data = JSON.parse(json, symbolize_names: true)
    @result_data1 = @result_data[:results][:shop]
  end

  def show
  end
end
