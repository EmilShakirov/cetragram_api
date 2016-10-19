class CreateUser
  include Interactor

  delegate :decorated_oauth, :password, to: :context
  delegate :email, :provider, to: :decorated_oauth

  before do
    context.password ||= Devise.friendly_token.first(8)
  end

  def call
    context.fail! if user.invalid?
  end

  private

  def user
    context.user ||= User.create(user_params)
  end

  def user_params
    {
      email: email,
      password: password,
      password_confirmation: password
    }
  end
end
