class SessionsController < ApplicationController
	
	def new; end
	
	def create
		user = User.find_by(name: params[:name])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to root_path
		else
			redirect_to login_path
		end
	end
	
	def destroy
		session.clear
		redirect_to root_path
	end
	
	def sign_in_with_omniauth
		user = User.find_by(uid: auth['uid'])
		if user && user.authenticate('banana')
			session[:user_id] = user.id
			redirect_to root_path
		else
			redirect_to login_path
		end
	end
	
	def create_with_omniauth
		User.create_with_omniauth(auth) unless User.find_by(name: auth['info']['name'])
		sign_in_with_omniauth
	end
end
