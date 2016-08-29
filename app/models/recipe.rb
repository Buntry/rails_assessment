class Recipe < ActiveRecord::Base
	belongs_to :user
	
	has_many :recipe_ingredients
	has_many :ingredients, through: :recipe_ingredients, counter_cache: true
	
	accepts_nested_attributes_for :ingredients
	
	scope :by_user, -> (user) { where(user_id: user.id) }
	scope :most_ingredients, -> { order('ingredients_count desc') }
	
	def ingredients_attributes=(ingredient_attributes)
		ingredient_attributes.values.each do |ingredient_attribute|
			if ingredient_attribute['name'].length > 0
				ingredient = Ingredient.find_or_create_by(ingredient_attribute) 
				self.ingredients << ingredient
			end
    end
  end
end
