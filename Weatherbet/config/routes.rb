Rails.application.routes.draw do

  get 'users/show'

  devise_for :users
  
  resources :locations
  resources :reports
  resources :predictions
  
  #set the index page
  root 'pages#home'

  get 'pages/home'

  get 'pages/weather'

  get 'pages/locations'

  get 'pages/forums'

  get 'pages/reports'
  get 'pages/predictions'

  # get 'profile' => 'users#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
