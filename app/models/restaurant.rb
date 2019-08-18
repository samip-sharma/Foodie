
class Restaurant < ApplicationRecord
  has_many :user_restaurants
  has_many :users , through: :user_restaurants

    def self.get_restaurants_from_yelp (term)
        url = "https://api.yelp.com/v3/businesses/search"
        params = {
          term: term,
          latitude: 40.700862,
          longitude: -73.987472,
          limit: 50,
          radius: 500
        }
        response = HTTP.auth("Bearer cQIy3LDS7Xw7Xt6W-4iSW7rkaPuuv56XJ9UgQK1I0Y55Ks4BlJeys3j6B7Ewje2scBJEjbfCEId7dd2foDVpCLvGasb0vklV4ZEZBkJqmj_KTzIhNg3yh4P_pXBVXXYx").get(url, params: params)
        return response.parse
    end


    def self.get_restaurant_detail(id)
      url= "https://api.yelp.com/v3/businesses/#{id}"
      response = HTTP.auth("Bearer cQIy3LDS7Xw7Xt6W-4iSW7rkaPuuv56XJ9UgQK1I0Y55Ks4BlJeys3j6B7Ewje2scBJEjbfCEId7dd2foDVpCLvGasb0vklV4ZEZBkJqmj_KTzIhNg3yh4P_pXBVXXYx").get(url)
      return response.parse
    end

end
