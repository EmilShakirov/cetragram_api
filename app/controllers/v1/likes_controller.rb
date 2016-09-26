module V1
  class LikesController < ApplicationController
    authenticate_user

    expose :like, parent: :current_user

    def create
      like.save

      respond_with like
    end

    def destroy
      like.destroy

      respond_with like
    end

    private

    def like_params
      params.require(:like).permit(:image_id)
    end
  end
end
