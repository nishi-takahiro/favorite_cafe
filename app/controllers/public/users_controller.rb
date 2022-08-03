class Public::UsersController < ApplicationController
  def show
   @user = current_user
  end

  def edit
    @user = current_user
  end
  
  def index
  end
  
  def create
  end
  
  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to public_users_my_page_path
    else
      render :edit
    end
  end
  
  
  
  def confirmation
  end
  
  def withdraw
    # 退会ステータス
    @user = User.find(current_customer[:id])
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end
  
  private
  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :profile_image)
  end
end
