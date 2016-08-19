class ApplicationController < ActionController::API
  include ActionController::ImplicitRender
  include Authentication

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  respond_to :json
end
