FactoryGirl.define do
  factory :imgur_image, class: OpenStruct do
    link { Faker::Internet.url("imgur.com") }
  end
end
