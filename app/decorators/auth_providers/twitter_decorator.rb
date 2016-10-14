module AuthProviders
  class TwitterDecorator < BaseAuthDecorator
    def email
      "#{nickname}@twitter_oauth.com"
    end

    def nickname
      object.alias
    end
  end
end
