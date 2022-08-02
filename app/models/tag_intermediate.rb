class TagIntermediate < ApplicationRecord
    has_many :tags, dependent: :destroy
    has_many :articles, dependent: :destroy
end
