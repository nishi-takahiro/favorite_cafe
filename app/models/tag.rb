class Tag < ApplicationRecord
    has_many :tag_intermediates, dependent: :destroy
    
    # searchの検索方法分岐検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @tag = Tag.where("tag LIKE?","#{word}")
    elsif search == "forward_match"
      @tag = Tag.where("tag LIKE?","#{word}%")
    elsif search == "backward_match"
      @tag = Tag.where("tag LIKE?","%#{word}")
    elsif search == "partial_match"
      @tag = Tag.where("tag LIKE?","%#{word}%")
    else
      @tag = Tag.all
    end
  end
end
