Rails.application.routes.draw do
  root   'pages#home'
  get    '/hello',    to: 'pages#hello'
  get    '/home',	 to: 'pages#home'
  get    '/about',   to: 'pages#about'
  get    '/contact', to: 'pages#contact'
