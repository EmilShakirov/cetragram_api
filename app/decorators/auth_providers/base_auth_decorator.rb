module AuthProviders
  class BaseAuthDecorator < Draper::Decorator
    delegate_all

    def verified?
      id
    end
  end
end
