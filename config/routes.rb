Rails.application.routes.draw do
	root 'recipes#index'
	
	resources :users
	delete '/users/:id' => 'users#destroy', as: 'destroy_user'
	
	#Sessions
	get  '/login'  => 'sessions#new'
	post '/login'  => 'sessions#create'
	get  '/logout' => 'sessions#destroy'
	
	#Omniauth
	get "/auth/:provider/callback" => "sessions#create_with_omniauth"
	get '/omniauth-login' => 'sessions#sign_in_with_omniauth', as: 'o_login'
	
	resources :recipes do
		resources :ingredients, only: [:index]
	end
	
	delete '/recipes/:id' => 'recipes#destroy', as: 'destroy_recipe'
	
	get '/ingredients' => 'ingredients#index', as: 'ingredients'
end
