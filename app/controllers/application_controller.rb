class ApplicationController < ActionController::API
    # before_action :authenticate_user
  
    def authenticate_user
      header = request.headers['Authorization']
      if header.nil?
        render json: { error: 'Missing token' }, status: :unauthorized
        return
      end
      
      token = header.split(' ').last
      begin
        decoded = JWT.decode(token, Rails.application.secret_key_base)[0]
        @current_user = User.find(decoded['user_id'])
      rescue JWT::DecodeError => e
        render json: { error: 'Invalid token', message: e.message }, status: :unauthorized
      end
    end
  
    def current_user
      @current_user
    end
  end
  

# class ApplicationController < ActionController::API
#     before_action :authenticate_user
  
#     def authenticate_user
#       header = request.headers['Authorization']
#       token = header.split(' ').last if header
#       decoded = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
#       @current_user = User.find(decoded['user_id'])
#     rescue
#       render json: { error: 'Unauthorized' }, status: :unauthorized
#     end
  
#     def current_user
#       @current_user
#     end
# end
  