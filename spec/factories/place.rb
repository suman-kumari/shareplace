FactoryGirl.define do
  factory :place do
    address { Faker::Address.full_address }
    title   { Faker::Lorem.words(2) }
    is_public true
  end
end
