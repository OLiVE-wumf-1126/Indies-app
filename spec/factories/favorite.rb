FactoryBot.define do
  factory :favorite do
    association :post
    association :listener
  end
end
