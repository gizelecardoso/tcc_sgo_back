class ApplicationController < ActionController::API
  before_action :authorized

  def encode_token(payload)
    JWT.encode(payload, 'yourSecret')
  end

  def auth_header
    request.headers['Authorization']
  end

  def decoded_token
    if auth_header
      token = auth_header.split(' ')[1]
      begin
        JWT.decode(token, 'yourSecret', true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def logged_in_official
    if decoded_token
      official_id = decoded_token[0]['official_id']
      @official = Official.find_by(id: official_id)
    end
  end

  def logged_in
    !!logged_in_official
  end

  def authorized
    render json: { message: 'Necessário logar' }, status: :unauthorized unless logged_in?
  end
end
