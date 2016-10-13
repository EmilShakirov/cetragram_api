module AuthProviders
  class BaseAuthDecorator < Draper::Decorator
    delegate_all
  end
end
