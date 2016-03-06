class SessionsController < Devise::SessionsController
  respond_to :json
  skip_before_action :authenticate_user_from_token!

  def create
    @user = User.find_for_database_authentication(email: params[:email])
    return invalid_login_attempt unless @user

    if @user.valid_password?(params[:password])
      sign_in :user, @user
      render json: @user, serializer: AuthenticatedUserSerializer
    else
      invalid_login_attempt
    end
  end
  
  private

  def invalid_login_attempt
    warden.custom_failure!
    render json: { message: "Bad username or password" }, status: :unprocessable_entity
  end

end