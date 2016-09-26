class ImgurClient
  include Procto.call

  attr_reader :file, :session
  private :file, :session

  delegate :image, to: :session
  delegate :image_upload, to: :image
  delegate :resolve, to: "Container"

  def initialize(file)
    @file = file
    @session = resolve(:imgur_session)
  end

  def call
    image_upload(file)
  end
end
