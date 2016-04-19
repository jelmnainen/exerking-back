class UsersController < ApplicationController
  skip_before_action :authenticate_user_from_token!, only: :reset_password

  def index
    @users = User.all
    @users.each do |user|
      authorize! :read, user
    end
    render json: @users
  end

  def reset_password
    user = User.where(email: params[:email]).first
    if user
      user.reset_password!
      UserMailer.password_reset(user).deliver_now
    end
    render status: :accepted, json: { email: params[:email] }
  end
end
