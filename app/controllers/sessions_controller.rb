class SessionsController < ApplicationController
  skip_before_action :authorize_request, only: [:create]

  def create
    user = User.find_by(username: params[:username])

    if user&.authenticate(params[:password])
      token = generate_jwt(user)
      render json: { token: token }, status: :ok
    else
      render json: { message: 'Invalid credentials' }, status: :unauthorized
    end
  end

  private 

  def generate_jwt(user)
    payload = { user_id: user.id }
    secret = Rails.application.secret_key_base
    expiration = 24.hours.from_now.to_i

    JWT.encode(payload.merge(exp: expiration), secret, 'HS256')
  end

end
