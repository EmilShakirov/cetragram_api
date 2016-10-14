module AuthProviders
  class FacebookDecorator < BaseAuthDecorator
    def nickname
      name.parameterize("_")
    end
  end
end
