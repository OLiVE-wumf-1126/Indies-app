FactoryBot.define do
  factory :comment do
    comment { 'コメントです' }
    association :post
    association :listener
  end
end
