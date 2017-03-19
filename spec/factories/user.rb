FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    name  { Faker::Internet.user_name}
    password '12345678'
    password_confirmation '12345678'
  end

  factory :friend, parent: :user do
  end
end
