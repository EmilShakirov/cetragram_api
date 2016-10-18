module V1
  class OauthUsersController < ApplicationController
    def create
      result = VerifyOauthAndFindUser.call(oauth_data: oauth_user_params[:oauth_data])
      status = result.success? ? :ok : :unprocessable_entity

      respond_with result.user, serializer: SessionSerializer, status: status
    end

    private

    def oauth_user_params
      params.fetch(:oauth_user, {}).tap do |whitelisted|
        whitelisted[:oauth_data] = params[:oauth_user][:oauth_data]
      end
    end
  end
end
