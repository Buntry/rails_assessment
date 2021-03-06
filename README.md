My project was a recipe manager website. Users can create recipes and view the recipes of other users. Below I'll show snippets of my code and how they fulfill the project requirements.

<<<<<<< HEAD
- Use the Ruby on Rails framework. Check.

- Models must include a `has_many`, a `belongs_to`, and a `has_many :through` relationship. 

```ruby
class User < ActiveRecord::Base
	has_secure_password
	has_many :recipes
	has_many :ingredients, through: :recipes
end

class Recipe < ActiveRecord::Base
	belongs_to :user
	
	has_many :recipe_ingredients
	has_many :ingredients, through: :recipe_ingredients
end


class Ingredient < ActiveRecord::Base
	has_many :recipe_ingredients
	has_many :recipes, through: :recipe_ingredients
end
```

- Models must include one class level ActiveRecord scope methods

```ruby 
class Recipe < ActiveRecord::Base	
	scope :by_user, -> (user) { where(user_id: user.id) }
	scope :most_ingredients, -> { order('ingredients_count desc') }
end
```

- Must include nested forms with custom attribute writers.

```ruby
<!--- recipes/_recipe.html.erb -->
<%= form_for @recipe do |f| %>
  <%= f.collection_select :ingredient_ids,  Ingredient.all, :id, :name, {}, {:multiple => true} %> <br>
  <%= f.label 'Custom Ingredients' %> <br>
  <%= f.fields_for :ingredients, @recipe.ingredients.build do |ing_field| %>
    <%= ing_field.text_field :name %> <br>
  <% end %>
  <%= f.submit 'Create Recipe' %>
<% end %>
```

```ruby
# class Recipe < ActiveRecord::Base
def ingredients_attributes=(ingredient_attributes)
  ingredient_attributes.values.each do |i_attribute|
    if i_attribute['name'].length > 0
      ingredient = Ingredient.find_or_create_by(i_attribute)
      self.ingredients << ingredient
    end
  end
end
```

- Must provide standard authentication and be able to log on using a third party.

```ruby
class User < ActiveRecord::Base
  has_secure_password
	
  def self.create_with_omniauth(auth)
    create! do |user|
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.password = rand(36**length).to_s(36) # Unused Random String
    end
  end
end
```

- Must have a nested resource.

```ruby
# /config/routes.rb
resources :recipes do
	resources :ingredients, only: [:index]
end
```

- Must display validation errors in forms

```ruby
<div id='alert_field'>
  <% flash_alerts.each do |alert| %>
    <%= alert %>
  <% end %>
</div>
```
=======
Check my blog kerpar.co
>>>>>>> 2fcaf786b85f29d4ec993111c2f83e0db7bba228
