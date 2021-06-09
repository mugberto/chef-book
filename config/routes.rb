Rails.application.routes.draw do
  root to: 'recipes#index'
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :recipes
  post 'follow/new', to: 'followings#create', as: 'follow' 
end
