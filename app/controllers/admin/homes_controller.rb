class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
    begin
      # 全投稿を新しい順番に表示をする
      @articles = Article.all.order(created_at: :desc).page(params[:page]).per(20)
    rescue
      redirect_to root
    end

  end
end