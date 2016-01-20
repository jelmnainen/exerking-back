class HelloController < ActionController::Base

	def view 
		render json: 'hello'
	end
end
