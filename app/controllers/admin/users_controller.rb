class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @users = User.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
    @articles = @user.articles.order(created_at: :desc).page(params[:page]).per(20)
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
   user = User.find(params[:id])
   if user.update(user_params)
      redirect_to admin_user_path(user), notice: "編集内容を保存しました"
   else
      render "edit"
   end
  end
  
  private
    def user_params
      params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :profile_image, :is_deleted)
    end
end
