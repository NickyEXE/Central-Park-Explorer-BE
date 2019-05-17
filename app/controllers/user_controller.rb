class UserController < ApplicationController

  def create
    @user = User.new(username: params[:username], password: params[:password])
    if @user.save
      render json: @user
    else
      render json: {error: @user.errors.full_messages}
    end
  end

end
