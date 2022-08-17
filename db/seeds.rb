# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
    email: 'admin@admin',
    password: '7777777',
    password_confirmation: '7777777',
)

User.create!(
    email: '2451_7777777@gmail.com',
    password: '2451_7777777',
    last_name: '大阪',
    first_name: '太郎',
    last_name_kana: 'オオサカ',
    first_name_kana: 'タロウ',
    )