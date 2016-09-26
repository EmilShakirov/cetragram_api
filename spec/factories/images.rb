FactoryGirl.define do
  factory :image do
    caption { Faker::Lorem.sentence }
    link { Faker::Internet.url("imgur.com") }
    name { Faker::Internet.user_name }
    user
  end
end
