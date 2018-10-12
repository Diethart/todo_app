Rails.application.routes.draw do
  post "oauth/callback" => "oauths#callback"
  get "oauth/callback" => "oauths#callback" # for use with Github, Facebook
  get "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider

  root to: 'checklists#index'
  resources :items
  resources :checklist_templates
  resources :checklists
  resources :item_results, only: %i[update]
  resources :users, only: %i[new create]
  resources :user_sessions, only: %i[new create destroy]

  get '/login', to: 'user_sessions#new', as: :login
  post '/logout', to: 'user_sessions#destroy', as: :logout
  get '/register', to: 'users#new', as: :register
end
