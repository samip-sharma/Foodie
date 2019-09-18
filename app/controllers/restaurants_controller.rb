class RestaurantsController < ApplicationController

  def add_like
    user_id=params[:user_id].to_i
    restaurant_id = params[:restaurant_id]
    user = User.find(user_id)
    restaurant = Restaurant.find_by(real_id:restaurant_id)
    desired_restaurant = user.restaurants.select{|restaurant| restaurant.real_id==restaurant_id}
      if(desired_restaurant.length!=0)
        user.user_restaurants.find_by(restaurant_id:desired_restaurant[0].id).destroy
      else
        if(restaurant)
          user.restaurants << restaurant
        else
        new_restaurant = Restaurant.create(name:params[:restaurant_name] ,real_id:restaurant_id)
        user.restaurants << new_restaurant 
        end
      end
      render json: {"like_added": true}
  end

  def getRestaurants
  @data = Restaurant.get_restaurants_from_yelp(params[:term],params[:xcoo],params[:ycoo])
  render json: @data
  end


  def restaurantUser
    restaurant = Restaurant.find_by(real_id:params[:restaurant_id])
    if (!restaurant.nil?)
      users = restaurant.users 
      render json: users
    else 
      render json:{error: "restaurant not in database"}
    end
  end

  def getRestaurantDetail
    if (true)
      user_id = params[:user_id].to_i
      user = User.find(user_id)
      restaurant = user.restaurants.select {|restaurant| restaurant.real_id==params[:id]}
        if (restaurant[0])
          @restaurant = Restaurant.get_restaurant_detail(params[:id])
          @restaurant["liked"] = true
        render json: @restaurant
        else
        @restaurant = Restaurant.get_restaurant_detail(params[:id])
        @restaurant["liked"]=false
        render json: @restaurant, liked: false
        end
    end
  end

end

