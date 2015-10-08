Rails.application.routes.draw do
  root 'welcomes#index'

  # Users
  get 'signup', to: 'users#new', as: 'signup'
  resources :users

  # Sessions
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  resources :sessions, only: [:new, :create, :destroy]

  # Prompts and 'responses'
  resources :prompts, except: [:edit, :update, :destroy]
  get 'prompts/:id/responses/new', to: 'prompts#new_response', as: 'new_response'
  post 'prompts/:id/responses', to: 'prompts#create_response', as: 'responses'

  # Characters & Concepts
  resources :characters, :concepts
  get 'concepts/:id/responses/new', to: 'concepts#new_response', as: 'concept_response'
  post 'concepts/:id/responses', to: 'concepts#create_response', as: 'concept_responses'

  mount Attachinary::Engine => '/attachinary'
end
