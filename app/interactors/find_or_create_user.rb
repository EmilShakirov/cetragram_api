class FindOrCreateUser
  include Interactor

  delegate :decorated_oauth, :user, to: :context
  delegate :email, :id, :provider, to: :decorated_oauth
  delegate :identities, to: :user, prefix: true

  def call
    context.user ||= find_or_create_user

    context.fail! if user.invalid? || identity.invalid?
  end

  private

  def find_or_create_user
    user_by_identity || user_by_email || new_user
  end

  def identity
    context.identity ||= user_identities
                         .by_provider_and_uid(provider, id)
                         .first_or_create
  end

  def new_user
    User.create(user_params)
  end

  def password
    context.password ||= Devise.friendly_token.first(8)
  end

  def user_by_identity
    Identity.from_omniauth(decorated_oauth)&.user
  end

  def user_by_email
    User.find_by(email: email)
  end

  def user_params
    {
      email: email,
      password: password,
      password_confirmation: password
    }
  end
end
