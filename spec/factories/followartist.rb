FactoryBot.define do
  factory :followartist do
    association :artist
    association :listener
  end
end