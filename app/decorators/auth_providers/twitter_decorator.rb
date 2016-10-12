module AuthProviders
  class TwitterDecorator < BaseAuthDecorator
    def verified?
      credentials.token
    end

    def nickname
      object.alias
    end
  end
end
