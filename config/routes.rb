Rails.application.routes.draw do
  resources :user_restaurants
  resources :follows
  resources :tokens
  resources :users
  get '/getRestaurant', to: "restaurants#getRestaurants"
  get '/getRestaurantDetail/:id', to: "restaurants#getRestaurantDetail"
  get '/getFavRestaurants/:id', to: "user_restaurants#getFavRestaurants"
  get '/following/:id', to: "follows#following"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
