class UsersController < ApplicationController
  def create
    user = User.new(username: params[:username], password: params[:password], email: params[:email])
    if user.save
      render json: user
    else
      # handle errors
    end
  end

  private

  def user_params
    params.require(:User).permit(:username, :password, :email)
  end
end
