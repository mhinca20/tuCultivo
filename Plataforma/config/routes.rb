Rails.application.routes.draw do
  devise_for :users
  
  get 'plague_reports/create'
  
  resources :farms do
    resources :lots do 
      resources :grooves
    end  
  end
  
  root to: "nodes#index"


  resources :nodes do
    resources :sensors
    delete "/sensors/:id", to: "sensors#destroy", as:"delete_sensor"
    post "/sensors", to: "sensors#create", as:"create_sensor"
   
    get '/sensors/:sensor_id/values', to: 'sensors#values', as: 'values'
  end

  post '/sensors/:id/values', to: 'sensors#create_value'
  post '/grooves/:groove_id/reports', to: 'plague_reports#create'
end
