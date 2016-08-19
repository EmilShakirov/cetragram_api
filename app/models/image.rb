class Image < ActiveRecord::Base
  belongs_to :user

  validates :link, :name, :user, presence: true
end
