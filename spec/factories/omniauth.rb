FactoryGirl.define do
  factory :omniauth_hash, class: OpenStruct do
    provider "facebook"
    id "123123"
    email "john_smith@example.com"
    name "Boris Eltsin"
    verified true
    info { OpenStruct.new(verified: true) }
  end
end
