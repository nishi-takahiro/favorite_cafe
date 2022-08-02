class Public::UsersController < ApplicationController
  def show
   @user = current_user
  end

  def edit
  end

  def unsubscribe
  end

  def index
  end
  
  private
  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :profile_image)
  end
end
