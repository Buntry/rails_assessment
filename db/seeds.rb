# Create Users
u1 = User.create(name: 'Ben Tyler', password: '1234')
u2 = User.create(name: 'Anish Pillai', password: '1234')
u3 = User.create(name: 'Julia Healy', password: '1234')

# Recipes
# I choose sandwiches because their ingredients overlap
pbj = Recipe.create(name: 'Peanut Butter and Jelly Sandwich', description: 'A recipe so simple its taste confounds even computer programs!', user_id: u1.id)
monte = Recipe.create(name: 'Monte Cristo Sandwich', description: 'I was in fear and trembling, having heard so many tales of the abuse aliens receive there.... The attendants were very kind and not at all rough with us. It was the noon hour... in a little while porters came along with baskets of very good ham and cheese sandwiches and coffee for the grown-ups and milk for the babies', user_id: u2.id)
turkam = Recipe.create(name: 'Turkey and Ham Sandwich', description: "It gets Old Man Griep's seal of approval.", user_id: u3.id)

#Ingredients
two_slices = Ingredient.create(name: 'Two slices of bread')
pb = Ingredient.create(name: 'Peanut Butter')
and_j = Ingredient.create(name: 'Jelly')
fried_ham = Ingredient.create(name: 'Fried Ham')
cheese = Ingredient.create(name: 'Cheese')
turk = Ingredient.create(name: 'Turkey')
ham = Ingredient.create(name: 'Ham')

RecipeIngredient.create(recipe_id: pbj.id, ingredient_id: two_slices.id)
RecipeIngredient.create(recipe_id: pbj.id, ingredient_id: pb.id)
RecipeIngredient.create(recipe_id: pbj.id, ingredient_id: and_j.id)

RecipeIngredient.create(recipe_id: monte.id, ingredient_id: two_slices.id)
RecipeIngredient.create(recipe_id: monte.id, ingredient_id: fried_ham.id)
RecipeIngredient.create(recipe_id: monte.id, ingredient_id: cheese.id)

RecipeIngredient.create(recipe_id: turkam.id, ingredient_id: two_slices.id)
RecipeIngredient.create(recipe_id: turkam.id, ingredient_id: turk.id)
RecipeIngredient.create(recipe_id: turkam.id, ingredient_id: ham.id)
RecipeIngredient.create(recipe_id: turkam.id, ingredient_id: cheese.id)

