module V1
  class ImagesController < ApplicationController
    authenticate_user only: %i(create)

    expose(:image)
    expose(:images) { Image.all }

    def create
      result = Images::Create.call(params: image_params, user: current_user)

      self.image = result.image

      respond_with image
    end

    def index
      respond_with images
    end

    private

    def image_params
      params.require(:image).permit(:caption, :file)
    end
  end
end
