Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/patients', to: 'emergency_transfer_summary#index'  

  resources :emergency_transfer_summary, only: [:show]
  
  root 'emergency_transfer_summary#index'  
end
