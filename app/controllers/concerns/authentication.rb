module Authentication
  extend ActiveSupport::Concern

  module ClassMethods
    def authenticate_user(options = {})
      acts_as_token_authentication_handler_for User, options
    end
  end
end
