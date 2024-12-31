class UsersController < ApplicationController
  skip_before_action :authorize_request, only: [:create]

  def show
    user = User.find(params[:id])
    render json: user
  end
  def create
    user = User.new(username: params[:username], password: params[:password], email: params[:email])
    if user.save
      token = generate_jwt(user)
      render json: { user: user, token: token }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email)
  end

  def generate_jwt(user)
    payload = { user_id: user.id }
    secret = Rails.application.secret_key_base
    expiration = 24.hours.from_now.to_i
    JWT.encode(payload.merge(exp: expiration), secret, 'HS256')
  end
end
