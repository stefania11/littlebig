Rails.application.routes.draw do

  root to: "welcome#index"
  resources :characters, :concepts
  resources :prompts, except: [:edit, :update, :destroy]

end
