class UsersController < ApplicationController

  def index
    @users = User.all
    @users.each do |user|
      authorize! :read, user
    end
    render json: @users
  end
  
end