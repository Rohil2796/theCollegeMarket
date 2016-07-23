Rails.application.routes.draw do
  root   'pages#home'
  get    'pages/hello',    to: 'pages#hello'
  get    'pages/home',	 to: 'pages#home'
  get    'pages/help',    to: 'pages#help'
  get    'pages/about',   to: 'pages#about'
  get    'pages/contact', to: 'pages#contact'
end