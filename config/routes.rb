Rails.application.routes.draw do
  root 'welcomes#index'
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :characters, :concepts
  resources :prompts, except: [:edit, :update, :destroy]
end
