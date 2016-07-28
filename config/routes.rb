Rails.application.routes.draw do
  root   'pages#home'
  get    'pages/hello' 
  get    'pages/home' 
  get    'pages/help' 
  get    'pages/about'
  get    'pages/contact'
  get  '/signup',  to: 'users#new'
  resources :users 
end