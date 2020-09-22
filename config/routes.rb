Rails.application.routes.draw do
  defaults format: :json do
    delete '/logout', to: "sessions#logout"
    delete '/deleteFromCurrent', to: "food_list_items#delete_from_current"
    get '/logged_in', to: "sessions#logged_in"
    post '/addFoodToCurrent', to: "food_list_items#add_food_to_current"
    post '/updateDaily/:type/:int/:dec', to: 'food_lists#update_daily'
    post '/updateCurrent', to: 'users#update_current'
    post '/updateCurrentImage', to: "users#update_current_image"
    resources :sessions, only: [:create]
    resources :registrations, only: [:create]
    resources :foods, only: [:create, :index, :show]
    resources :food_list_items, only: [:create, :destroy]
    resources :food_lists, only: [:index]
    resources :images, only: [:update]
  end
  root "static#home"
end
