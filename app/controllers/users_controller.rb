class UsersController < ApplicationController

    def index
        users = User.all 
        render json: users     
    end

    def addFriend
        user1 = User.find(params[:follower])
        user2 = User.find(params[:following])
        user2.followers << user1
        render json: {added: true}
    end

    def deleteFriend
        user1 = User.find(params[:follower])
        user2 = User.find(params[:following])
        user2.followers.delete(user1)
        render json: {added: false}
    end

    def create
        user = User.create(user_params)
        if user.valid?
            render json: auth_response_json(user) 
        else
            render json: { errors: user.errors.full_messages }
        end 
    end

    def show
        user_id = params[:id]
        if authorized?(user_id) 
            user = User.find(params[:clickedUser])
        render json: user
        else
            tell_user_to_go_away! 
        end
    end

    def destroy
        user = User.find(params[:id])
        user.destroy()
    end

    private
    def user_params
        params.permit(:name, :user_name, :password)
    end
    
end
