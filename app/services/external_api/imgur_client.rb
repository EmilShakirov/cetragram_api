module ExternalApi
  class ImgurClient
    include Concord.new(:file)
    include Procto.call

    DEFAULT_PARAMS = {
      access_token: ENV["IMGUR_ACCESS_TOKEN"],
      client_id: ENV["IMGUR_ID"],
      client_secret: ENV["IMGUR_SECRET"],
      refresh_token: ENV["IMGUR_REFRESH_TOKEN"]
    }.freeze

    delegate :image, to: :session
    delegate :image_upload, to: :image

    def call
      image_upload(file)
    end

    private

    def session
      @session ||= Imgurapi::Session.new(**DEFAULT_PARAMS)
    end
  end
end
