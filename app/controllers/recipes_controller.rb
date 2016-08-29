class RecipesController < ApplicationController
	def index
		@recipes = Recipe.all
	end
	
	def new
		@recipe = Recipe.new
		redirect_to root_path unless signed_in?
	end
	
	def create
		recipe = Recipe.new(recipe_params)
		if recipe.save
			redirect_to recipe
		else
			redirect_to new_recipe_path, error: 'Could not create recipe.'
		end
	end
	
	def show
		@recipe = Recipe.find(params[:id])
	end
	
	def destroy
		@recipe = Recipe.find(params[:id])
		if @recipe.user == current_user
			@recipe.delete
			redirect_to root_path
		else
			redirect_to @recipe, error: 'Could not delete recipe.'
		end
	end
	
	private
	def recipe_params
		params.require(:recipe).permit(:user_id, :name, :description, ingredient_ids: [], ingredients_attributes: [:name])
	end
end
