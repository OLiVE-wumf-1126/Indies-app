FactoryBot.define do

  factory :post do
    id {1}
    youtube_url {"https://www.youtube.com/watch?v=abcdefghijk"}
    text {"テストです"}
    title {"タイトルです"}
    association :artist
  end
end