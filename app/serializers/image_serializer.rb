class ImageSerializer < ApplicationSerializer
  attributes :id, :caption, :link, :name

  has_many :likes
end
