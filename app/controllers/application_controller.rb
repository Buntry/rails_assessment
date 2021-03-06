class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
	
	helper_method :current_user, :signed_in?
	
	def current_user
		User.find(session[:user_id]) if session[:user_id] && User.exists?(session[:user_id])
	end
	
	def signed_in?
		!!current_user
	end
	
	def auth
    request.env['omniauth.auth']
  end
end
