class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_one_attached :profile_image
  has_many :likes, dependent: :destroy
  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy

def get_profile_image(width,height)
  if profile_image.attached?
    profile_image.variant(resize_to_limit:[width,height])
  else
    file_path = Rails.root.join('app/assets/images/no_image.jpg')
    profile_image.attached(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpg')
  end
end

def full_name
  last_name  + " " +  first_name
end

# searchの検索方法分岐検索方法分岐
 def self.looks(search, word)
    if search == "perfect_match"
      @user = User.where(["first_name LIKE? OR last_name LIKE?", "#{word}", "#{word}"])
    elsif search == "forward_match"
      @user = User.where(["first_name LIKE? OR last_name LIKE?", "#{word}%", "#{word}%"])
    elsif search == "backward_match"
      @user = User.where(["first_name LIKE? OR last_name LIKE?", "%#{word}", "%#{word}"])
    elsif search == "partial_match"
      @user = User.where(["first_name LIKE? OR last_name LIKE?", "%#{word}%", "%#{word}%"])
    else
      @user = User.all
    end
  end

end