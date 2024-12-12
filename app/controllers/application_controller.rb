class ApplicationController < ActionController::API
  before_action :authorize_request

  private

  def authorize_request
    header = request.headers['Authorization']
    token = header.split(' ').last if header

    begin
      decoded = decode_jwt(token)
      @current_user = User.find(decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: 'Invalid token' }, status: :unauthorized
    end
  end

  def decode_jwt(token)
    secret = Rails.application.secret_key_base
    decoded = JWT.decode(token, secret, true, algorithm: 'HS256')
    HashWithIndifferentAccess.new(decoded[0])
  end

  attr_reader :current_user
end
