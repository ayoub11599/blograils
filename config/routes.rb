Rails.application.routes.draw do
  root "auth/login#new"

  namespace :auth do
    get "/register", to: "register#new"
    post "/register", to: "register#create"
    get "/login", to: "login#new"
    post "/login", to: "login#create"
    post "/logout", to: "logout#destroy"
  end
  
  namespace :app do
    get "/", to: "dashboard#index", as: "dashboard"
    resources :categories
    resources :blogs
  end

end
