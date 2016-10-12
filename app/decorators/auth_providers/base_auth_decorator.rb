module AuthProviders
  class BaseAuthDecorator < Draper::Decorator
    delegate_all

    def email
      nil
    end
  end
end
