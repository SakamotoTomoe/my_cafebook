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
  'モーニング',
  'ランチ',
  'ディナー',
  '禁煙',
  'デカフェ',
  'カウンター',
  'ひとり',
  'ママ友',
  '女子会',
  'デート',
  'アルコール'
]

words.each do |word|
  Keyword.create!(
    keyword: word
  )
end