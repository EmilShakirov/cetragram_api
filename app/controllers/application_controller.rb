class ApplicationController < ActionController::API
  include ActionController::ImplicitRender
  include Authentication

  respond_to :json
end
