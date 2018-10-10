Rails.application.routes.draw do
  root to: 'items#index'
  resources :items
  resources :checklist_templates
  resources :checklists
  resources :item_results, only: %i[update]
end
