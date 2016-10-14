class ApplicationController < ActionController::API
  include ActionController::ImplicitRender
  include Authentication

  respond_to :json

  private

  def devise_parameter_sanitizer
    if resource_class == User
      User::ParameterSanitizer.new(User, :user, params)
    else
      super
    end
  end
end
