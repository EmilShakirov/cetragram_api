class VerifyOauthAndFindUser
  include Interactor

  delegate :oauth, :oauth_data, to: :context
  delegate :provider, to: :oauth
  delegate :verified?, to: :decorated_oauth

  before do
    context.oauth = JSON.parse(oauth_data.to_json, object_class: OpenStruct)
  end

  def call
    context.fail! unless verified?

    find_user
  end

  private

  def decorated_oauth
    "AuthProviders::#{provider.to_s.classify}Decorator"
      .constantize
      .new(oauth)
  end

  def find_user
    context.user = UserServices::FromOauthFetcher.call(decorated_oauth)
  end
end
