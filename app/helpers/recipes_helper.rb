module RecipesHelper
	def delete_rlink recipe
		link_to 'Destroy', destroy_recipe_path(recipe), method: :delete
	end
	
	def recipe_deletable recipe
		delete_rlink recipe if recipe.user == current_user
	end
end
