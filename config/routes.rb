Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  devise_for :users, controllers: { sessions: 'users/sessions' }, path: '',
             path_names: { sign_in: 'login', sign_out: 'logout' }, as: 'user_sessions'
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
