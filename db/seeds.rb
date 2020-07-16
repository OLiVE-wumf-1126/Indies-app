# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do |n|
  Artist.create!(
    email: "test#{n + 1}@test.com",
    artistname: "テストアーティスト#{n + 1}",
    password: "abcd1234"
  )
end

5.times do |n|
  Listener.create!(
    email: "test#{n + 1}@test.com",
    nickname: "テストリスナー#{n + 1}",
    password: "abcd1234"
  )
end

Artist.all.each do |artist|
  artist.posts.create!(
  youtube_url: "https://www.youtube.com/watch?v=HB4QrJyWqEw",
  text: "テスト投稿テキスト",
  title: "テスト投稿"
  )
end