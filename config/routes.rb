Rails.application.routes.draw do
  devise_for :users
  root to: "nodes#index"

  resources :nodes
  resources :sensors
  post 'sensors/:id/', to: 'sensors#create_value' 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # GET "sensors/", to: "sensors#index"
  get 'sensors/:id/values', to: 'sensors#values', as: 'values'
end
