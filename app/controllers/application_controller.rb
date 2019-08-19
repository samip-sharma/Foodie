class ApplicationController < ActionController::API

def authorized?(user_id)
    token = try_get_jwt_token
    return token.present? && token["user_id"] == user_id.to_i
end

def authenticated?
    try_get_jwt_token.present?
end


# sending to frontend
def auth_response_json(user)
    { token: make_token(user.id), user_name: user.user_name, user_id: user.id, name: user.name }
end

def tell_user_to_go_away!
    render :json => { go_away: true }, :status => :unauthorized
end

private 

def make_token(user_id)
    JWT.encode({ user_id: user_id }, "asdfhasdkjhfjkasdfjkhbas", 'HS256')
end

# ENV["JWT_SECRET_KEY"]

def decode_token(token_string)
    JWT.decode(token_string, "asdfhasdkjhfjkasdfjkhbas", true, { algorithm: 'HS256' })
end

def try_get_jwt_token
    token_string = request.headers["Authorization"]
    if token_string.present?
    begin
        decoded_token = decode_token(token_string)
    rescue JWT::VerificationError
        return nil
    end
    return decoded_token.first # gets the payload out of the dumb array that JWT returns
    else
    nil
    end
end

end