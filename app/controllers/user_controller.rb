class UserController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    @user = User.create(username: params[:username], password: params[:password])
    if @user.valid?
      token = encode_token({user_id: @user.id})
      render json: {user: @user, jwt: token }
    else
      render json: {error: @user.errors.full_messages}, status: :not_acceptable
    end
  end


  def show
    render json: current_user
  end

end
