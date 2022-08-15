class Article < ApplicationRecord
    has_many :likes, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :tag_intermediates, dependent: :destroy
    has_many :tags, through: :tag_intermediates
    
    belongs_to :user
    belongs_to :store
   
    
    has_one_attached :store_image
    
    # いいね機能メソッド
  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end
    
  # タグ付けの新規投稿用メソッド  
  def save_tags(tags)
      tags.each do |new_tags|
      self.tags.find_or_create_by(tag: new_tags)
    end
  end
  
    # タグ付けの更新用メソッド
  def update_tags(latest_tags)
        if self.tags.empty?
          # 既存のタグがなかったら追加だけ行う
            latest_tags.each do |latest_tag|
            self.tags.find_or_create_by(tag: latest_tag)
          end
        elsif latest_tags.empty?
          # 更新対象のタグがなかったら既存のタグをすべて削除
          # 既に保存がされていたら既に登録されているタグの内容を削除
            self.tags.each do |tag|
            self.tags.delete(tag)
          end
        else
            # 既存のタグも更新対象のタグもある場合は差分更新
            current_tags = self.tags.pluck(:tag)
            #左を起点に引き算をする
            #　　　　　　 b             a b c
            old_tags = current_tags - latest_tags
            #一致したものを取り出す
            # a c       a b c            b 
            new_tags = latest_tags - current_tags
            # a  c
            old_tags.each do |old_tag|
            tag = self.tags.find_by(tag: old_tag)
            self.tags.delete(tag) if tag.present?
          end
    
            new_tags.each do |new_tag|
            # b
            self.tags.find_or_create_by(tag: new_tag)
          end
        end
    end
end
