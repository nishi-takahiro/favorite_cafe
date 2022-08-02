class Public::UsersController < ApplicationController
  def show
   @user = current_user
  end

  def edit
    @user = current_user
  end
  
  def create
  end
  
  def update
  end
  
  def index
  end
  
  def confirmation
  end
  
  def withdraw
  end
  
  private
  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :profile_image)
  end
end
