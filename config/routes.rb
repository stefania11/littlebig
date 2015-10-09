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

  # Collections
  post 'collections/:prompt_id', to: 'collections#create', as: 'collect'
  delete 'collections/:prompt_id', to: 'collections#destroy', as: 'uncollect'

  # Characters & Concepts
  resources :characters, :concepts
  get 'concepts/:id/mentions/new', to: 'concepts#new_mention', as: 'new_concept_mention'
  post 'concepts/:id/mentions', to: 'concepts#create_mention', as: 'concept_mentions'

  mount Attachinary::Engine => '/attachinary'
end
