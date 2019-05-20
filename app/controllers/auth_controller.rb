class AuthController < ApplicationController
  skip_before_action :authorized, only: [:create]
  def create
    @user = User.find_by(username: user_login_params[:username])
    #User#authenticate comes from BCrypt
    if @user && @user.authenticate(user_login_params[:password])
      # encode token comes from ApplicationController
      token = encode_token({ user_id: @user.id })
      render json: { user: @user, jwt: token }, status: :accepted
    else
      if @user
        render json: {errors: "That password was incorrect!", type: "password"}, status: :unauthorized
      else
        render json: {errors: "We couldn't find someone with that username.", type: "username"}, status: :unauthorized
      end
    end
  end

  def auto_login
    if decoded_token
      @user = User.find_by(id: decoded_token[0]["user_id"])
        if @user
          render json: @user
        else
          render json: {errors: "Couldn't find a user matching the shared decoded auth token"}
        end
    else
      render json: {errors: "Something happened. That decoded token was invalid."}
    end
  end

  private

  def user_login_params
    # params { user: {username: 'Chandler Bing', password: 'hi' } }
    params.permit(:username, :password)
  end

end
