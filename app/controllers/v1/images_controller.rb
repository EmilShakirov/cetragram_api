module V1
  class ImagesController < ApplicationController
    authenticate_user only: %i(create show)

    expose(:image)
    expose(:images) do
      Image
        .includes(:likes)
        .page(params[:page])
        .per(24)
        .order(created_at: :desc)
    end

    def create
      result = CreateImage.call(params: image_params, user: current_user)

      self.image = result.image

      respond_with image
    end

    def index
      respond_with images, serializer: PaginatedArraySerializer
    end

    def show
      respond_with image
    end

    private

    def image_params
      params.require(:image).permit(:caption, :file)
    end
  end
end
