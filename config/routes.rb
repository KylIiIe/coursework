Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { registrations: 'registrations' }
  root to: 'books#index'

  resources :genres
  resources :users
  resources :authors
  resources :books
  resources :reviews
  get '/home', to: 'books#index'
  get '/search_book', to: 'books#search'
end
