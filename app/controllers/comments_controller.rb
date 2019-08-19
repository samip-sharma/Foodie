class CommentsController < ApplicationController

    def getComments
        user_id=params[:user_id].to_i
        restaurant_id=params[:restaurant_id]
        user=User.find(user_id)
        restaurant=Restaurant.find_by(real_id:restaurant_id)
        
        render json: restaurant.comments

    end

    def addComments
        # byebug
        user_id=params[:user_id].to_i
        restaurant_id=params[:restaurant_id]
        user=User.find(user_id)
        restaurant=Restaurant.find_by(real_id:restaurant_id)
            if restaurant.nil?
                restaurant=Restaurant.create(name:params[:restaurant_name],real_id:restaurant_id)
            end
         comment=Comment.create(context:params[:context],user_id:user_id,restaurant_id:restaurant.id)
        render json: comment
    end
end
