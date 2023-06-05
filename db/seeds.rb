# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!(
  [
    {email: 'olivia@example.com', user_name: 'Olivia', password: 'password', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")},
    {email: 'james@example.com', user_name: 'James', password: 'password', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")},
    {email: 'lucy@example.com', user_name: 'Lucy', password: 'password', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")}
  ]
)

reviews = Review.create!(
  [
    {cafe_name: 'スターバックス', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-review1.jpg"), filename:"sample-review1.jpg"), address: '東京都', opening_hours: '10：00～21：00', day_off: '年中無休', review: '大人気のカフェです。', user_id: users[0].id },
    {cafe_name: 'ドトール', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-review2.jpg"), filename:"sample-review2.jpg"), address: '大阪府', opening_hours: '月～金　12：00～17：00、　土　10：00～18：00', day_off: '日曜日', review: 'ケーキがおいしい！', user_id: users[1].id },
    {cafe_name: 'タリーズ', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-review3.jpg"), filename:"sample-review3.jpg"), address: '福岡県', opening_hours: '土・日　12：00～16：00', day_off: '月～金', review: 'コーヒー好きな方にオススメ！', user_id: users[2].id }
  ]
)

Admin.create!(
  email: "abc@abc",
  password: "abcabc"
  )

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

# words.each do |word|
#   Keyword.create!(
#     keyword: word
#   )
# end

words.map{|word| Keyword.create(keyword: word)}

KeywordReview.create(review: Review.find(1), keyword: Keyword.find(4))
KeywordReview.create(review: Review.find(1), keyword: Keyword.find(10))
KeywordReview.create(review: Review.find(1), keyword: Keyword.find(11))

KeywordReview.create(review: Review.find(2), keyword: Keyword.find(13))
KeywordReview.create(review: Review.find(2), keyword: Keyword.find(15))
KeywordReview.create(review: Review.find(2), keyword: Keyword.find(34))

KeywordReview.create(review: Review.find(3), keyword: Keyword.find(24))
KeywordReview.create(review: Review.find(3), keyword: Keyword.find(29))
KeywordReview.create(review: Review.find(3), keyword: Keyword.find(36))
