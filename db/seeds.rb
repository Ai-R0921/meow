# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Admin.create!(
#   email: 'abcd@hotmail.com',
#   password: '123456'
#   )


admins = [
  {email: 'abcd@hotmail.com', password: '123456'},
]
admins.each do |admin|
  admin_data = Admin.find_by(email: admin[:email])
  if admin_data.nil?
    Admin.create(email: admin[:email], password: admin[:password])
  end
end

types = ["アメリカンショートヘア",
 "スコティッシュフォールド",
 "ミヌエット",
 "タイ",
 "雑種",
 "ブリティッシュショートヘア",
 "ベンガル",
 "マンチカン",
 "エキゾチックショートヘア",
 "シャム",
 "ロシアンブルー",
 "ペルシャ",
 "三毛猫",
 "メインクーン",
 "ラグドール",
 "サイベリアン",
 "ノルウェージャンフォレストキャット",
 "アメリカンカール",
 "ソマリ",
 "スフィンクス",
 "アビシニアン",
 "アメリカンボブテイル",
 "オリエンタルショートヘア",
 "ラガマフィン",
 "ヒマラヤン",
 "ブリティッシュロングヘア",
 "その他",
 "マンクス"
]

types.each do |type|
  Type.find_or_create_by(name: type)
end