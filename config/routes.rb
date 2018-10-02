Rails.application.routes.draw do
  root to: 'items#index'
  resources :items
  resources :checklist_templates
end
