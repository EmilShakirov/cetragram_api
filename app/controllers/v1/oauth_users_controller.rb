module V1
  class OauthUsersController < ApplicationController
    expose(:oauth) { OpenStruct.new(oauth_user_params[:oauth_data]) }
    expose(:user) { UserServices::FromOauthFetcher.call(oauth_hash_decorated) }

    def create
      respond_with user, serializer: SessionSerializer
    end

    private

    def oauth_hash_decorated
      "AuthProviders::#{oauth.provider.to_s.classify}Decorator"
        .constantize
        .new(oauth)
    end

    def oauth_user_params
      params.fetch(:oauth_user, {}).tap do |whitelisted|
        whitelisted[:oauth_data] = params[:oauth_user][:oauth_data]
      end
    end
  end
end
