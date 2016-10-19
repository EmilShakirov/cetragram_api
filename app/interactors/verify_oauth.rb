class VerifyOauth
  include Interactor

  delegate :oauth, :oauth_data, to: :context
  delegate :provider, to: :oauth
  delegate :verified?, to: :decorated_oauth

  before do
    context.oauth = JSON.parse(oauth_data.to_json, object_class: OpenStruct)
  end

  def call
    context.fail! unless verified?
  end

  private

  def decorated_oauth
    context.decorated_oauth = "AuthProviders::#{provider.to_s.classify}Decorator"
                              .constantize
                              .new(oauth)
  end
end
