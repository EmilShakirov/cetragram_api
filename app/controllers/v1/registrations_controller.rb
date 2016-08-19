module V1
  class RegistrationsController < Devise::RegistrationsController
    wrap_parameters :user
  end
end
