class IngredientsController < ApplicationController
	def index
		@ingredients = Ingredient.most_recipes
	end
end
