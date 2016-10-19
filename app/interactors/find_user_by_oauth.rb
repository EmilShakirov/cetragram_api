class FindUserByOauth
  include Interactor

  delegate :decorated_oauth, to: :context

  def call
    context.user = Identity.from_omniauth(decorated_oauth)&.user
  end
end
