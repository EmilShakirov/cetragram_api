module V1
  class SessionsController < Devise::SessionsController
    wrap_parameters :user

    expose(:user) { AuthenticateUser.call(warden: warden).user }

    def create
      respond_with user, serializer: SessionSerializer
    end
  end
end
