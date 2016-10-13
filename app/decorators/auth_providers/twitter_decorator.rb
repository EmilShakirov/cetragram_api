module AuthProviders
  class TwitterDecorator < BaseAuthDecorator
    def verified?
      id
    end

    def nickname
      object.alias
    end
  end
end
