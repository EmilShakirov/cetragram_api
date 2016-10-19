class FindUserByEmail
  include Interactor

  delegate :decorated_oauth, :user, to: :context
  delegate :identities, to: :user, prefix: true
  delegate :email, :provider, :id, to: :decorated_oauth

  def call
    context.user ||= User.find_by(email: email)

    context.fail! if identity&.invalid?
  end

  private

  def identity
    return unless user

    context.identity ||= user_identities
                         .by_provider_and_uid(provider, id)
                         .first_or_create
  end
end
