module AuthProviders
  class FacebookDecorator < BaseAuthDecorator
    def verified?
      info.verified || extra.raw_info.verified
    end

    def nickname
      name.parameterize("_")
    end
  end
end
