user1 = FactoryGirl.create :user
user2 = FactoryGirl.create :user
user3 = FactoryGirl.create :user

[user1, user2, user3].each do |user|
  10.times do
    file = File.open("db/seeds/development/fixtures/img#{rand(1..5)}.jpeg", "a+")

    Image.new.tap do |image|
      image.assign_attributes(user: user, file: file)
      image.save
    end
  end

  Image.all.sample(rand(15..30)).each do |image|
    FactoryGirl.create :like, user: user, image: image
  end
end
