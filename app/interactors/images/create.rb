module Images
  class Create
    include Interactor

    delegate :params, :image, :imgur_image, :user, to: :context
    delegate :link, :name, to: :imgur_image, allow_nil: true
    delegate :original_filename, to: :file

    def call
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

    def upload
      context.imgur_image = ExternalApi::ImgurClient.call(file)
    end
  end
end
