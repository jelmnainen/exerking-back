class RegistrationsController < Devise::RegistrationsController
  respond_to :json
  skip_before_action :authenticate_user_from_token!
end