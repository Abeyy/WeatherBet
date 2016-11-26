Rails.application.routes.draw do
  
  get 'pages/forums'

  get 'pages/login'

  #set the index page
  root 'pages#home'

  get 'pages/home'

  get 'pages/weather'

  get 'pages/locations'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
