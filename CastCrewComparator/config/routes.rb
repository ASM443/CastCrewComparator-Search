Rails.application.routes.draw do

  resources :casts

  get "/", to: "main#index"
end
