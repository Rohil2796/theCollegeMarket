Rails.application.routes.draw do
 
  resources :post_attachments
  resources :posts
  
  resources :photos, only: [:new, :create, :index, :destroy]
  resources :categories
  resources :communities
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
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :tbposts,          only: [:create, :destroy]
end

