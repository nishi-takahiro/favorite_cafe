# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(email: ENV['ADMIN_MAIL'],  password: ENV['ADMIN_PASS'])

# ユーザー
User.create!( email: '7777777@example.com', password: '7777777', last_name: '西', first_name: '孝宏', last_name_kana: 'ニシ', first_name_kana: 'タカヒロ', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg") )
User.create!( email: '7777777_1@example.com', password: '7777777_1', last_name: '鈴木', first_name: '幸太郎', last_name_kana: 'スズキ', first_name_kana: 'コウタロウ',profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg") )
User.create!( email: '7777777_2@example.com', password: '7777777_2', last_name: '佐藤', first_name: '美樹', last_name_kana: 'サトウ', first_name_kana: 'ミキ', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg") )
User.create!( email: 'jon345@example.com', password: 'testjon345', last_name: '水村', first_name: '涼', last_name_kana: 'ミズムラ', first_name_kana: 'リョウ', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user4.jpg"), filename:"sample-user4.jpg") )
User.create!( email: 'jts109@example.com', password: 'testjts109', last_name: '佐藤', first_name: '加奈', last_name_kana: 'サトウ', first_name_kana: 'カナ', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user5.jpg"), filename:"sample-user5.jpg") )
User.create!( email: 'jhs777@example.com', password: 'testjhs777', last_name: '祇園', first_name: '美香', last_name_kana: 'ギオン', first_name_kana: 'ミカ', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user6.jpg"), filename:"sample-user6.jpg") )

# 店舗の緯度、経度
Store.create!(lat: '34.6795905', lng: '135.8312563')
Store.create!(lat: '34.686476', lng: '135.687613')
Store.create!(lat: '34.6697151', lng: '135.6884495')
Store.create!(lat: '34.4923433', lng: '135.76598')
Store.create!(lat: '34.67736647038737', lng: '135.83322072854995')
Store.create!(lat: '34.6740601', lng: '135.8311644')
Store.create!(lat: '34.6759882', lng: '135.8260486')
Store.create!(lat: '34.682058', lng: '135.827285')
Store.create!(lat: '34.6987742', lng: '135.795434')
Store.create!(lat: '34.6967392', lng: '135.7820071')


# 投稿の内容
Article.create!(store_id: '1', user_id: '1', store_name: 'SUNNY and MORE', address: '奈良県奈良市東寺林町7', store_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-cafe1.jpg"), filename:"sample-cafe1.jpg"), store_comment: '沢山の種類のケーキを一度に沢山食べることができます。観光地にも近いので、観光途中の休憩としても利用することができます。', rate_delicious: '1', rate_atmospher: '1', rate_cost: '1')
Article.create!(store_id: '2', user_id: '2', store_name: '生駒山の石窯ピザ雲亭', address: '奈良県生駒市門前町2-10',store_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-cafe2.jpg"), filename:"sample-cafe2.jpg"), store_comment: '生駒山の中腹に位置しており、奈良の景色を楽しみながらピザを楽しめる場所になっています。パリパリもっちりの生地を同時に味わうことができるので、ピザ好きの人にはオススメの場所になります',rate_delicious: '5', rate_atmospher: '5', rate_cost: '5')
Article.create!(store_id: '3', user_id: '3', store_name: 'ラッキーガーデン', address: '奈良県生駒市鬼取町168',store_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-cafe3.jpg"), filename:"sample-cafe3.jpg"), store_comment: 'スリランカ料理を食べることができます。辛そうに見えますが食べやすく美味しいです。自然の中で食べる料理は、いつもよりも料理が美味しく感じます。',rate_delicious: '4.5', rate_atmospher: '4', rate_cost: '4')
Article.create!(store_id: '4', user_id: '4', store_name: 'だんご庄本店', address: '奈良県橿原市東坊城町860',store_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-cafe4.jpg"), filename:"sample-cafe4.jpg"), store_comment: 'きなこたっぷりかかった柔らかい団子を食べることがきます。',rate_delicious: '3', rate_atmospher: '3', rate_cost: '3')
Article.create!(store_id: '5', user_id: '5', store_name: 'カナカナ', address: '奈良県奈良市公納堂町13',store_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-cafe5.jpg"), filename:"sample-cafe5.jpg"), store_comment: '奈良の中でもとても人気のお店です。早くから沢山の人が並んでるお店です。料理は小鉢に細かく入っており、バランスのいい体に優しい料理を食べることができます。',rate_delicious: '4', rate_atmospher: '4', rate_cost: '4')
Article.create!(store_id: '6', user_id: '1', store_name: '鹿の舟 竈 (かまど)', address: '奈良県奈良市井上町１１',store_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-cafe7.jpg"), filename:"sample-cafe7.jpg"), store_comment: '美味しい白米を食べることができます。竈で炊いたご飯を食べることがきるので、ごはんがツヤツヤと輝いていて、甘みが口の中で広がってくれます。',rate_delicious: '5', rate_atmospher: '5', rate_cost: '5')
Article.create!(store_id: '7', user_id: '2', store_name: '蕎麦処 はやし', address: '奈良県奈良市南袋町１',store_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-cafe7.jpg"), filename:"sample-cafe7.jpg"), store_comment: '蕎麦とてんぷらのセットがとても美味しいです。',rate_delicious: '2.5', rate_atmospher: '3.5', rate_cost: '3')
Article.create!(store_id: '8', user_id: '2', store_name: '堀内果実園', address: '奈良県奈良市角振町２３',store_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-cafe8.jpg"), filename:"sample-cafe8.jpg"), store_comment: 'フルーツを使ったデザートを沢山食べることができます。フルーツ好きにはたまらないお店だと思うので是非いってください。',rate_delicious: '5', rate_atmospher: '5', rate_cost: '5')
Article.create!(store_id: '9', user_id: '3', store_name: 'ピッツェリア ヴィラマーゴ', address: '奈良県奈良市佐紀町３１１２−１',store_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-cafe9.jpg"), filename:"sample-cafe9.jpg"), store_comment: 'ピザのアレンジ料理がたくさんあり選ぶのが大変です。パスタもモチモチとしており美味しいです。ピザとパスタを同時に食べてください。',rate_delicious: '4', rate_atmospher: '4', rate_cost: '4')
Article.create!(store_id: '10', user_id: '3', store_name: '菓子35山', address: '奈良県奈良市西大寺新町１丁目２−１７ 杜第２ビル 1-C',store_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-cafe10.jpg"), filename:"sample-cafe10.jpg"), store_comment: 'プリンが固めで美味しいです。コーヒーも注文が入ってから入れているので美味しくいただけます。',rate_delicious: '4', rate_atmospher: '4', rate_cost: '4')

# タグの内容
Tag.create!(tag: '奈良')
Tag.create!(tag: '生駒')
Tag.create!(tag: 'カフェ')
Tag.create!(tag: 'ピザ')
Tag.create!(tag: 'スイーツ')
Tag.create!(tag: 'コーヒー')
Tag.create!(tag: 'ケーキ')
Tag.create!(tag: 'だんご')
Tag.create!(tag: '自然')
Tag.create!(tag: 'フルーツ')
Tag.create!(tag: 'そば')
Tag.create!(tag: 'プリン')

# タグと投稿をつなぐ中間テーブル
TagIntermediate.create!(article_id: '1', tag_id: '1')
TagIntermediate.create!(article_id: '1', tag_id: '7')
TagIntermediate.create!(article_id: '2', tag_id: '1')
TagIntermediate.create!(article_id: '2', tag_id: '4')
TagIntermediate.create!(article_id: '3', tag_id: '1')
TagIntermediate.create!(article_id: '3', tag_id: '9')
TagIntermediate.create!(article_id: '4', tag_id: '1')
TagIntermediate.create!(article_id: '4', tag_id: '8')
TagIntermediate.create!(article_id: '5', tag_id: '1')
TagIntermediate.create!(article_id: '5', tag_id: '3')
TagIntermediate.create!(article_id: '6', tag_id: '1')
TagIntermediate.create!(article_id: '6', tag_id: '3')
TagIntermediate.create!(article_id: '7', tag_id: '1')
TagIntermediate.create!(article_id: '7', tag_id: '11')
TagIntermediate.create!(article_id: '8', tag_id: '1')
TagIntermediate.create!(article_id: '8', tag_id: '10')
TagIntermediate.create!(article_id: '9', tag_id: '1')
TagIntermediate.create!(article_id: '9', tag_id: '4')
TagIntermediate.create!(article_id: '10', tag_id: '1')
TagIntermediate.create!(article_id: '10', tag_id: '12')

# 投稿に対するコメント
Comment.create!(user_id: '1', article_id: '1', comment: '最初どのケーキから食べるのかも迷ってしまいます。')
Comment.create!(user_id: '2', article_id: '1', comment: '奈良の観光地に近いということで、奈良にいって休憩したい時には訪れたいと思います。')
Comment.create!(user_id: '3', article_id: '1', comment: '古着もあるそうですね。カフェでゆっくりしながら古着をみれるのはいいかもしれないので一度いってみます。')
Comment.create!(user_id: '2', article_id: '2', comment: '奈良の絶景を楽しみながら食事ができる最高の場所です。')
Comment.create!(user_id: '1', article_id: '2', comment: '私このお店の近くに住んでいるのに全然知らないお店でしたとても気になるので一度行ってみたいと思います。')
