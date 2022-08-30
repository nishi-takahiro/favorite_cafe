class Public::GuestsController < ApplicationController
    
  # ゲストユーザー
  def new_guest
   user = User.find_or_create_by!(email: 'guest@example.com') do |user|
    user.password = SecureRandom.urlsafe_base64
     # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    user.first_name = 'ユーザー'
    user.last_name = 'ゲスト'
    user.first_name_kana ='ユーザー'
    user.last_name_kana =  'ゲスト'
   end
   sign_in user
   redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
 end
end
