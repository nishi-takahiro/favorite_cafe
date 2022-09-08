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
    validates :store_name, length: { maximum: 200 }, presence: true
    validates :address, length: { maximum: 200 }
    validates :store_comment, length: { maximum:2000 }, presence: true
    # 5段階評価
    # 美味しさ
    validates :rate_delicious, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1}, presence: true
    # 雰囲気
    validates :rate_atmospher, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1}, presence: true
    # コストパフォーマンス
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

    # 新しいタグを作るとき文字数のチェックをする
      new_tags.each do |new|

        if new.size > 50
         return false
        end
      end

    #新しいタグを作っていく
    new_tags.each do |new|
      tag = Tag.find_by(tag: new.strip)


    #タグを作るときに存在している物はtrue、存在していないものはfalseにいき新しいタグを作る
      if tag
        tags << tag
      else
        tag = Tag.create!(tag: new.strip)
        tags << tag
      end

     end

  end

end
