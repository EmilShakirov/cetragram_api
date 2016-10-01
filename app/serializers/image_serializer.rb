class ImageSerializer < ApplicationSerializer
  attributes :id, :caption, :link

  has_many :likes

  delegate :file_url, to: :object

  def link
    "#{url_prefix}#{default_url}"
  end

  private

  def default_url
    file_url(resize: "300x")
  end

  def url_prefix
    "http://#{app_config.host}" if Rails.env.development?
  end
end
