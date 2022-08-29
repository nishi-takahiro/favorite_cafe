class Article < ApplicationRecord
    has_many :likes, dependent: :destroy
    has_many :comments, dependent: :destroy
    #articlesテーブルから中間テーブルに対する関連付け
    has_many :tag_intermediates, dependent: :destroy
    #articlesテーブルから中間テーブルを介してTagsテーブルへの関連付け
    has_many :tags, through: :tag_intermediates, dependent: :destroy
    
    belongs_to :user
    belongs_to :store
    
    # storeの画像
    has_one_attached :store_image
    
    # バリデーション
    validates :store_name, length: { maximum: 500 }, presence: true
    validates :address, length: { maximum: 500 }
    validates :store_comment, length: { maximum:2000 }, presence: true
    # 5段階評価
    validates :rate_delicious, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1}, presence: true
    
    validates :rate_atmospher, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1}, presence: true
    
    validates :rate_cost, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1}, presence: true
    
  # searchの検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @article = Article.where(['store_comment LIKE(?) OR store_name LIKE(?) OR address LIKE(?)', "#{word}", "#{word}","#{word}"])
    elsif search == "forward_match"
      @article = Article.where(['store_comment LIKE(?) OR store_name LIKE(?) OR address LIKE(?)',"#{word}%", "#{word}%", "#{word}%"])
    elsif search == "backward_match"
      @article = Article.where(['store_comment LIKE(?) OR store_name LIKE(?) OR address LIKE(?)',"%#{word}", "%#{word}", "%#{word}"])
    elsif search == "partial_match"
      @article = Article.where(['store_comment LIKE(?) OR store_name LIKE(?) OR address LIKE(?)',"%#{word}%", "%#{word}%", "%#{word}%"])
    else
      @article = Article.all
    end
  end  
  
   # いいね機能メソッド
  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end
    
  # タグ付けの新規投稿用メソッド  
  def save_tags(sent_tags)
    # タグが存在していれば、タグの名前を配列として全て取得
     current_tags = self.tags.pluck(:tag) unless self.tags.nil?
    # 現在取得したタグから送られてきたタグを除いてoldtagとする
    old_tags = current_tags - sent_tags
    # 送信されてきたタグから現在存在するタグを除いたタグをnewとする
    new_tags = sent_tags - current_tags

    # 古いタグを消す
    old_tags.each do |old|
      self.tags.delete Tag.find_by(tag: old)
    end
    
    new_tags.each do |new|
      tag = Tag.find_by(tag: new.strip)
     
    
      
      if tag
        tags << tag
      else
        tag = Tag.create!(tag: new.strip) 
         tags << tag
      end
        

      
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
            self.tags.delete(tag.strip)
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
