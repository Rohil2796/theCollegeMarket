Rails.application.routes.draw do
  get 'sessions/new'

  root   'pages#home'
  get    '/hello' ,  to: 'pages#hello'
  get    '/home' ,  to: 'pages#home'
  get    '/help' ,  to: 'pages#help'
  get    '/about',  to: 'pages#about'
  get    '/contact',  to: 'pages#contact'
  get    '/signup',  to: 'users#new', as: :signup_path
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users 
end