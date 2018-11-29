Rails.application.routes.draw do
  root "static_pages#home"
  get "/help", to: "static_pages#help"
  get "/about", to: "static_pages#about"
  get "/contact",to: "static_pages#contact"
  get  "/signup", to: "members#new"
  post "/signup", to: "members#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get  "/post", to: "stories#new"
  post "/post", to: "stories#create"
  resources :stories
  resources :members
end
