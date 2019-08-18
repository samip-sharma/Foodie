class FollowsController < ApplicationController

    def following
        user=User.find(params[:id])
        render json: user.followees
    end
end
