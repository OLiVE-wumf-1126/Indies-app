FactoryBot.define do

  factory :listener do
    nickname {"testリスナーさん"}
    email {"hoge@hoge.jp"}
    password {"hoge369hoge"}
    password_confirmation {"hoge369hoge"}
  end
end