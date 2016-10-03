class Image < ActiveRecord::Base
  include ImageUploader[:file]

  belongs_to :user
  has_many :likes

  validates :file_data, :user, presence: true
end
