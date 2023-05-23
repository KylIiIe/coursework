Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root to: 'pages#index'

  resources :genres
  resources :users
  resources :authors
  resources :books
  resources :places
  resources :reviews
  get '/home', to: 'pages#index'
  get "/books", to: "pages#index"
  get "/cabinet", to: "books#cabinet"
  get "/createAdvert", to: "books#createAdvert"
end
