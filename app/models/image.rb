class Image < ActiveRecord::Base
  belongs_to :user
  has_many :likes

  validates :link, :name, :user, presence: true
end
