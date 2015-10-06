Rails.application.routes.draw do
  root 'welcomes#index'

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :characters, :concepts
  resources :prompts, except: [:edit, :update, :destroy]

  mount Attachinary::Engine => '/attachinary'
end
