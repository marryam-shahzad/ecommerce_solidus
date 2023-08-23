class ApplicationController < ActionController::Base
	# helper_method :current_user

	def current_user=(user)
    	@current_user = user
  	end

  # Get the current user
  	def current_user
  	 	@current_user ||= user_from_remember_token
  	end

end
