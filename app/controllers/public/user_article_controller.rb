class Public::UserArticleController < ApplicationController
    before_action :authenticate_user!
    
    def show
        @user = User.find(params[:id])
        @user_articles = @user.articles.all.order(created_at: :desc).page(params[:page]).per(15)
    end
end
