class Ingredient < ActiveRecord::Base
	has_many :recipe_ingredients
	has_many :recipes, through: :recipe_ingredients, counter_cache: true
	
	validates :name, presence: true, length: { minimum: 2 }
	
	scope :most_recipes, -> { order('recipes_count desc') }
end
