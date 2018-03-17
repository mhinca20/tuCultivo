Rails.application.routes.draw do
  devise_for :users
  root to: "nodes#index"


  resources :nodes do
    resources :sensors
    delete "/nodes/:node_id/sensors/:id", to: "sensors#destroy", as:"delete_sensor"
    post "/nodes/:node_id/sensors", to: "sensors#create", as:"create_sensor"
  end

  post 'sensors/:id/values', to: 'sensors#create_value'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # GET "sensors/", to: "sensors#index"
  get 'sensors/:id/values', to: 'sensors#values', as: 'values'
end
