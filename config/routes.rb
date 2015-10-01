Rails.application.routes.draw do
  root 'welcomes#index'

  resources :characters, :concepts
  resources :prompts, except: [:edit, :update, :destroy]
end
