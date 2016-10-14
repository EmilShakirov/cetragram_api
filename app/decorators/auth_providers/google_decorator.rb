module AuthProviders
  class GoogleDecorator < BaseAuthDecorator
    def nickname
      name.parameterize("_")
    end

    def name
      object.name.presence || email
    end
  end
end
