FactoryBot.define do
  factory :review do
    review {Faker::Lorem.sentence}
    association :user
    association :item
  end
end
