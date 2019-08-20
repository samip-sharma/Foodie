Rails.application.routes.draw do
  # resources :comments
  resources :user_restaurants
  resources :follows
  resources :tokens
  resources :users
  get '/users/:id/:clickedUser', to: "users#show"
  post '/getRestaurant/:term', to: "restaurants#getRestaurants"
  post '/getRestaurantDetail/:id', to: "restaurants#getRestaurantDetail"
  get '/getFavRestaurants/:id', to: "user_restaurants#getFavRestaurants"
  get '/following/:id', to: "follows#following"
  post '/addlike', to: "restaurants#add_like"
  post '/getComments' , to: "comments#getComments"
  post '/addComments' , to: "comments#addComments"
  get '/restaurants/:restaurant_id/users' , to: 'restaurants#restaurantUser'
  get'/users/:follower/addFriend/:following' , to: 'users#addFriend'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
