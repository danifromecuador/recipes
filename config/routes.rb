Rails.application.routes.draw do
  devise_for :users, controllers: {
  registrations: 'registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :foods, only: [:index, :new, :create, :destroy]

  resources :users, only: [:index]
  resources :recipes, only: [:index, :show, :new, :create, :destroy] do
    member do
      patch 'toggle_public'
    end
  end
  
  resources :recipe_foods, only: [:new, :create, :destroy] do
    member do
      get 'edit_quantity'
      patch 'update_quantity'
    end
  end

  get 'public_recipes', to: 'public_recipes#index', as: 'public_recipes'
  get 'public_recipes/:id', to: 'public_recipes#show', as: 'public_recipe'
  root to: "users#index"

  get '/shopping_list', to: 'shopping_list#index', as: 'shopping_list'
end
