class RestaurantSerializer < ActiveModel::Serializer
  attributes :restaurant , :comments
  def restaurant
    Restaurant.get_restaurant_detail(params[:id])
  end

  def comments
    restaurant=Restaurant.find(real_id:params[:id])
    return restaurant.comments
  end
end
