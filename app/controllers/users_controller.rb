class UsersController < ApplicationController
	def new
		@user = User.new
	end
	
	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to root_path, notice: "#{@user.name} successfully created."
		else
			redirect_to new_user_path, error: 'Unable to create user.'
		end
	end
	
	def destroy
		@user = User.find(params[:id])
		if @user == current_user
			@user.destroy
			redirect_to root_path, notice: "#{@user.name} successfully deleted."
		else
			redirect_to root_path, error: 'Unable to delete user.'
		end
	end
	
	def index
		@users = User.order('name asc')
	end
	
	def show
		@user = User.find(params[:id])
		@recipes = Recipe.by_user(@user).most_ingredients
	end
	
	private
	
		def user_params
			params.require(:user).permit(:name, :password)
		end
end
