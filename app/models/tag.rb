class Tag < ApplicationRecord
    has_many :tag_intermediates, dependent: :destroy
    

end
