class Tag < ApplicationRecord
    #Tagsテーブルから中間テーブルに対する関連付け
    has_many :tag_intermediates, dependent: :destroy
    #Tagsテーブルから中間テーブルを介してArticleテーブルへの関連付け
    has_many :articles, through: :tag_intermediates, dependent: :destroy

end
