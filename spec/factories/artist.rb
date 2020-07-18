FactoryBot.define do
  factory :artist do
    artistname { 'testアーティストさん' }
    email { 'hoge@hoge.jp' }
    password { 'hoge369hoge' }
    password_confirmation { 'hoge369hoge' }
    profile { 'アーティストです' }
    # artistimage {File.open("#{Rails.root}/app/assets/images/artist.jpeg")}
  end
end
