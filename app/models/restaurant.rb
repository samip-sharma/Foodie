
class Restaurant < ApplicationRecord
  has_many :user_restaurants ,dependent: :destroy
  has_many :users , through: :user_restaurants
  has_many :comments

  def self.get_restaurants_from_yelp (term,x,y)
    url = "https://api.yelp.com/v3/businesses/search"
      params = {
        term: term,
        latitude: x,
        longitude: y,
        limit: 50,
        radius: 500
      }
      response = HTTP.auth(ENV["SECRET_YELP_KEY"]).get(url, params: params)
      return response.parse
  end


  def self.get_restaurant_detail(id)
    url= "https://api.yelp.com/v3/businesses/#{id}"
    response = HTTP.auth(ENV["SECRET_YELP_KEY"]).get(url)
    return response.parse
  end

end
