Rails.application.routes.draw do
  root   'pages#home'
  get    'pages/hello' 
  get    'pages/home' 
  get    'pages/help' 
  get    'pages/about'
  get    'pages/contact'
  get  'users/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
end