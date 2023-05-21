Rails.application.routes.draw do
  root "books#index"

  get "/books", to: "books#index"
  get "/cabinet", to: "books#cabinet"
  get "/createAdvert", to: "books#createAdvert"
end
