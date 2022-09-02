class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
    # 全投稿を新しい順番に表示をする
    @articles = Article.all.order(created_at: :desc).page(params[:page]).per(20)
  end
end
