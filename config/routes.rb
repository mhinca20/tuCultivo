Rails.application.routes.draw do
  resources :sensors
  resources :nodes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # GET "sensors/", to: "sensors#index"
end
