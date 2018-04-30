Rails.application.routes.draw do
  devise_for :users
  resources :farms do
    resources :lots do 
      resources :grooves do 
        resources :plague_reports
      end
    end  
  end
  
 
  resources :nodes do
    resources :sensors
    delete "/sensors/:id", to: "sensors#destroy", as:"delete_sensor"
    post "/sensors", to: "sensors#create", as:"create_sensor"
   
    get '/sensors/:sensor_id/values', to: 'sensors#values', as: 'values'
  end

  post '/sensors/:id/values', to: 'sensors#create_value'
  post '/grooves/:groofe_id/reports', to: 'plague_reports#create'
  root to: "farms#index"
end
