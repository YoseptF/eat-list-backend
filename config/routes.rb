Rails.application.routes.draw do
  delete '/logout', to: "sessions#logout"
  get '/logged_in', to: "sessions#logged_in"
  resources :sessions, only: [:create]
  resources :registrations, only: [:create]
  resources :foods, only: [:create, :index, :show]
  root "static#home"
end
