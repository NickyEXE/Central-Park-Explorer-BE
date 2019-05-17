class AuthController < ApplicationController

  def login
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      render json: user
    else
      if user
        render json: {errors: "Your password is incorrect!", type: "password"}
      else
        render json: {errors: "We couldn't find someone with that username.", type: "username"}
      end
    end
  end

end
