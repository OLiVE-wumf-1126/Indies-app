FactoryBot.define do

  factory :listener do
    nickname {"testユーザーさん"}
    email {"hoge@hoge.jp"}
    password {"abcd1234"}
    password_confirmation {"abcd1234"}
  end
end