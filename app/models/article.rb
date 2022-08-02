class Article < ApplicationRecord
    has_many :likes, dependent: :destroy
    has_many :comments, dependent: :destroy
    belongs_to :user
    belongs_to :store
    belongs_to :tag_intermediate
end
