module UserServices
  class FromOauthFetcher
    include Concord.new(:auth)
    include Procto.call

    delegate :name, to: :auth

    def call
      update_user
      user
    end

    private

    def new_user
      UserServices::FromOauthCreator.call(auth)
    end

    def user
      @user ||= user_from_omniauth || user_found_by_email || new_user
    end

    def update_user
      user.update(name: name)
    end

    def user_found_by_email
      UserServices::ByEmailFinder.call(auth)
    end

    def user_from_omniauth
      Identity.from_omniauth(auth)&.user
    end
  end
end
