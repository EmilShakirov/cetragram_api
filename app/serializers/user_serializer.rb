class UserSerializer < ApplicationSerializer
  attributes :id, :email, :name

  has_many :likes
end
