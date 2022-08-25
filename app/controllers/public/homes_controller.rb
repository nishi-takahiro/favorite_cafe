class Public::HomesController < ApplicationController
  def top
    # 地図上にお店の情報を表示するためのデータ設定
    @stores = Store.all
    @article = Article.all
  end

  def about
  end
end
