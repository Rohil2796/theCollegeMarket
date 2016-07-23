Rails.application.routes.draw do
  root   'pages#home'
  get    '/hello',    to: 'pages#hello'
  get    '/home',	 to: 'pages#home'
  get    '/help',    to: 'pages#help'
  get    '/about',   to: 'pages#about'
  get    '/contact', to: 'pages#contact'
  get    '/signup',  to: 'users#new'
 
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