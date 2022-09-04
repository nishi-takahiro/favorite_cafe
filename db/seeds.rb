# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!( email: 'admin@example.com', password: '7777777', password_confirmation: '7777777' )

User.create!( email: '7777777@example.com', password: '7777777', last_name: '大阪', first_name: '太郎', last_name_kana: 'オオサカ', first_name_kana: 'タロウ' )
User.create!( email: '7777777_1@example.com', password: '7777777_1', last_name: '鈴木', first_name: '太郎', last_name_kana: 'スズキ', first_name_kana: 'タロウ' )
User.create!( email: '7777777_2@example.com', password: '7777777_2', last_name: '佐藤', first_name: '太郎', last_name_kana: 'サトウ', first_name_kana: 'タロウ' )
User.create!( email: '7777777_3@example.com', password: '7777777_3', last_name: '田中', first_name: '太郎', last_name_kana: 'タナカ', first_name_kana: 'タロウ' )
User.create!( email: '7777777_4@example.com', password: '7777777_4', last_name: '西村', first_name: '加奈子', last_name_kana: 'ニシムラ', first_name_kana: 'カナコ' )
User.create!( email: '7777777_5@example.com', password: '7777777_5', last_name: '西', first_name: '孝宏', last_name_kana: 'ニシ', first_name_kana: 'タカヒロ' )
User.create!( email: 'jon345@example.com', password: 'testjon345', last_name: '水村', first_name: '涼', last_name_kana: 'ミズムラ', first_name_kana: 'リョウ' )
User.create!( email: 'jts109@example.com', password: 'testjts109', last_name: '佐藤', first_name: '加奈', last_name_kana: 'サトウ', first_name_kana: 'カナ' )
User.create!( email: 'jhs777@example.com', password: 'testjhs777', last_name: '祇園', first_name: '美香', last_name_kana: 'ギオン', first_name_kana: 'ミカ' )
User.create!( email: 'jon999@example.com', password: 'testjon999', last_name: '神宮寺', first_name: '道子', last_name_kana: 'ジングジ', first_name_kana: 'ミチコ' )
User.create!( email: 'jth645@example.com', password: 'testjth645', last_name: '伊藤', first_name: '謙心', last_name_kana: 'イトウ', first_name_kana: 'ケンシン' )