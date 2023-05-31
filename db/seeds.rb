# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Keyword.create!(
  #keyword: "ランチ"
  #)

#Admin.create!(
  #email: "abc@abc",
  #password: "abcabc"
  #)

words = [
  '喫茶店',
  'コーヒー専門店',
  '和カフェ',
  'モダンカフェ',
  'デザインカフェ',
  'ダイニングカフェ',
  'モノトーンカフェ',
  'カフェバー',
  '古民家カフェ',
  'ひとりカフェ',
  'テイクアウト',
  'モーニング',
  'ランチ',
  'ディナー',
  '禁煙・喫煙スペース',
  '絶景',
  'Wi-Fi',
  'ペット可',
  'ベビーカーOK',
  'バリアフリー',
  'コンセント',
  '駐車場有',
  '座席',
  'カウンター',
  'テラス',
  'ソファー',
  'リラックス',
  'デート',
  'ワーク',
  'ママ会',
  '女子会',
  'コーヒー類',
  'ソフトドリンク',
  'ケーキ',
  'スイーツ',
  'デカフェ',
  'ココア',
  'アルコール',
  'お子様メニュー',
]

words.each do |word|
  Keyword.create!(
    keyword: word
  )
end