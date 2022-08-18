class Admin::HomesController < ApplicationController
  def top
    @articles = Article.all.order(created_at: :desc).page(params[:page]).per(20)
  end
end
