Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :tweets do
  resources :comments, only: [:create,  :destroy]
  end
  resources :users, only: [:show] 
  root'tweets#index'
end
