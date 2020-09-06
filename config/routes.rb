Rails.application.routes.draw do
  defaults format: :json do
    delete '/logout', to: "sessions#logout"
    delete '/deleteFromCurrent', to: "food_list_items#delete_from_current"
    get '/logged_in', to: "sessions#logged_in"
    post '/addFoodToCurrent', to: "food_list_items#add_food_to_current"
    resources :sessions, only: [:create]
    resources :registrations, only: [:create]
    resources :foods, only: [:create, :index, :show]
    resources :food_list_items, only: [:create, :destroy]
  end
  root "static#home"
end
