class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :article
    
    validates :comment, length: { minimum: 1,maximum: 800}, presence: true
    
  def self.looks(search, word)
    if search == "perfect_match"
      @comment = Comment.where(['comment LIKE(?)', "#{word}"])
    elsif search == "forward_match"
      @comment = Comment.where(['comment LIKE(?)', "#{word}%"])
    elsif search == "backward_match"
      @comment = Comment.where(['comment LIKE(?)', "%#{word}"])
    elsif search == "partial_match"
      @comment = Comment.where(['comment LIKE(?)', "%#{word}%"])
    else
      @comment = Comment.all
    end
  end  
  
end
