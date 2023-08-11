Rails.application.routes.draw do
  root to: "login#new"
  get "/register", to: "register#new", as: "register"
  post "/register", to: "register#store"
  get "/login", to: "login#new", as: "login"
  post "/login", to: "login#create"
  
  namespace :app do
    get "/", to: "dashboard#index", as: "dashboard"
  end

end
