class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  # ユーザー画像
  has_one_attached :profile_image
  
  has_many :likes, dependent: :destroy
  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :email, presence: true

def get_profile_image(width,height)
  if profile_image.attached?
    profile_image.variant(resize_to_limit:[width,height])
  else
    file_path = Rails.root.join('app/assets/images/no_image.jpg')
    profile_image.attached(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpg')
  end
end

# ユーザーのフルネーム
def full_name
  last_name  + " " +  first_name
end

# searchの検索方法分岐
# ユーザーの名前、カナで検索できるようになっている。
 def self.looks(search, word)
    if search == "perfect_match"
      @user = User.where(["first_name LIKE? OR last_name LIKE? OR first_name_kana LIKE? OR last_name_kana LIKE?", "#{word}", "#{word}", "#{word}", "#{word}"])
    elsif search == "forward_match"
      @user = User.where(["first_name LIKE? OR last_name LIKE? OR first_name_kana LIKE? OR last_name_kana LIKE?", "#{word}%", "#{word}%", "#{word}%", "#{word}%"])
    elsif search == "backward_match"
      @user = User.where(["first_name LIKE? OR last_name LIKE? OR first_name_kana LIKE? OR last_name_kana LIKE?", "%#{word}", "%#{word}", "%#{word}", "%#{word}"])
    elsif search == "partial_match"
      @user = User.where(["first_name LIKE? OR last_name LIKE? OR first_name_kana LIKE? OR last_name_kana LIKE?", "%#{word}%", "%#{word}%", "%#{word}%", "%#{word}%"])
    else
      @user = User.all
    end
  end

end