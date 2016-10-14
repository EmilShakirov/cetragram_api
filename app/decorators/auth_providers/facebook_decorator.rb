module AuthProviders
  class FacebookDecorator < BaseAuthDecorator
    def verified?
      id
    end

    def nickname
      name.parameterize("_")
    end
  end
end
