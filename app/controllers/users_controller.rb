class UsersController < ApplicationController

    def index
        users = User.all 
        render json: users     
    end

    def create
        user = User.create(user_params)
        if user.valid?
            render json: auth_response_json(user) # see application_controller.rb
        else
            render json: { errors: user.errors.full_messages }
        end 
    end

    def show
        user_id = params[:id]
        if authorized?(user_id) # see application_controller.rb
            user = User.find(user_id)
            render json: user
        else
            tell_user_to_go_away! # see application_controller.rb
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
