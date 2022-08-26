class Store < ApplicationRecord
    has_one_attached :store_image
    has_many :articles, dependent: :destroy
    
    validates :lat, :lng, presence: true
end
