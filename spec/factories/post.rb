FactoryBot.define do

  factory :post do
    youtube_url {"https://www.youtube.com/watch?v=abcdefghijk"}
    text {"テストです"}
    title {"タイトルです"}
    association :artist
  end
end