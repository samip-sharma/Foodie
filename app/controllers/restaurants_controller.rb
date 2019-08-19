

class RestaurantsController < ApplicationController

  def getRestaurants
  @data=Restaurant.get_restaurants_from_yelp(params[:term],params[:xcoo],params[:ycoo])
  render json: @data
  end

  def getRestaurantDetail  
    @data=Restaurant.get_restaurant_detail(params[:id])
    render json: @data
  end
end

