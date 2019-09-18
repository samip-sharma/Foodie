class UserRestaurantsController < ApplicationController
    
    def getFavRestaurants
        user = User.find(params["id"])
        favRestaurant = user.restaurants
        render json: favRestaurant
    end
    
end
