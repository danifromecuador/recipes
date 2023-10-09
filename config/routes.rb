Rails.application.routes.draw do
  devise_for :users, controllers: {
  registrations: 'registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :foods, only: [:index, :new, :create]

  resources :recipes, only: [:index, :show, :new, :create]

  get 'public_recipes', to: 'public_recipes#index', as: 'public_recipes'
  root to: "users#index"
end
