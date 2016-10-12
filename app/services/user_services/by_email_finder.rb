module UserServices
  class ByEmailFinder
    include Concord.new(:auth)
    include Procto.call

    delegate :identities, to: :user, prefix: true
    delegate :email, :provider, :id, to: :auth

    def call
      return unless user

      create_identity
      user
    end

    private

    def create_identity
      user_identities
        .by_provider_and_uid(provider, id)
        .first_or_create!
    end

    def user
      @user ||= User.find_by(email: email || Identity.generate_email(auth))
    end
  end
end
