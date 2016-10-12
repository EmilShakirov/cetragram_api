class User < ActiveRecord::Base
  acts_as_token_authenticatable

  devise :database_authenticatable,
    :recoverable,
    :registerable,
    :trackable,
    :validatable

  has_many :identities
  has_many :images
  has_many :likes
end
