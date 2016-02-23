class RegistrationsController < Devise::RegistrationsController
  respond_to :json
  skip_before_action :authenticate_user_from_token!

  protected

  def sign_up_params
    params.permit(:email, :password)
  end
end