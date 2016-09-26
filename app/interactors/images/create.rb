module Images
  class Create
    DEFAULT_SIZE = "300x300".freeze

    include Interactor

    delegate :params, :image, :imgur_image, :user, to: :context
    delegate :link, to: :imgur_image, allow_nil: true
    delegate :original_filename, :path, to: :file

    def call
      resize!
      upload
      context.fail! unless create
    end

    private

    def create
      context.image = user.images.create(image_params)
    end

    def file
      params[:file]
    end

    def image_params
      imgur_image_params.merge(params.except(:file))
    end

    def imgur_image_params
      {
        link: link,
        name: original_filename
      }
    end

    def resize!
      MiniMagick::Image.new(path).tap { |image| image.resize DEFAULT_SIZE }
    end

    def upload
      context.imgur_image = ImgurClient.call(file)
    end
  end
end
