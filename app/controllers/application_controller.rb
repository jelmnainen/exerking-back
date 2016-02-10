class ApplicationController < ActionController::API
	include CanCan::ControllerAdditions
	include AbstractController::Translation
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	# protect_from_forgery :null_session
	#before_action :authenticate_user_from_token!
	respond_to :json

	def authenticate_user_from_token!
  		auth_header = request.headers['Authorization'] || ""
  		auth_type, auth_token = auth_header.split(" ")

		if auth_token && auth_type == "Bearer"
			authenticate_with_auth_token auth_token
		else
			authentication_error
		end
	end

  	private

  	def authenticate_with_auth_token auth_token
  		unless auth_token.include?(':')
  			authentication_error
  			return
  		end

  		user_id = auth_token.split(':').first
  		user = User.where(id: user_id).first

  		if user && Devise.secure_compare(user.access_token, auth_token)
  			sign_in user, store: false
  		else
  			authentication_error
  		end
  	end

  	def authentication_error
  		render json: {error: 'unauthorized'}, status: 401
  	end

  	rescue_from CanCan::AccessDenied do |exception|
		redirect_to root_url
	end

end