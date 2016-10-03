FactoryGirl.define do
  factory :image do
    file { File.open("spec/support/fixtures/image.jpg") }
    caption { Faker::Lorem.sentence }
    user
  end
end
