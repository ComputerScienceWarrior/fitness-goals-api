class SessionsController < ApplicationController
  def create
    user = User.find_by(username: params[:username])
    
    if user&.authenticate(params[:password]) # Assumes you're using has_secure_password
      session[:user_id] = user.id
      render json: { message: 'Login successful' }, status: :ok
    else
      render json: { message: 'Invalid credentials' }, status: :unauthorized
    end
  end
end
