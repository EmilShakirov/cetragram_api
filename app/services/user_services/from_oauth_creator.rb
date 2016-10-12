module UserServices
  class FromOauthCreator
    include Concord.new(:auth)
    include Procto.call

    delegate :email, :provider, to: :auth

    def call
      user.save!
      user
    end

    private

    def password
      @password ||= Devise.friendly_token.first(8)
    end

    def user
      @user ||= User.new(user_params)
    end

    def user_email
      email || Identity.generate_email(auth)
    end

    def user_params
      {
        email: user_email,
        password: password,
        password_confirmation: password
      }
    end
  end
end
