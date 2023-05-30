Rails.application.routes.draw do
  resources :mentions
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { registrations: 'registrations' }
  root to: 'pages#index'

  resources :genres
  resources :users do
    resources :mentions, only: [:create, :destroy]
  end
  resources :authors
  resources :books
  resources :deals
  resources :reviews
  get '/home', to: 'pages#index'
  get '/search_book', to: 'books#search'
end
