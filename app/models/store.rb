class Store < ApplicationRecord
    has_one_attached :store_image
    has_many :articles, dependent: :destroy
    
    validates :lat, numericality: true, presence: true
    validates :lng, numericality: true, presence: true
end
