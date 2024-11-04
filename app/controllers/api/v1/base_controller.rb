module Api
  module V1
    class BaseController < ActionController::API
      include ActionController::HttpAuthentication::Token::ControllerMethods
      
      before_action :authenticate_token!
      
      private
      
      def authenticate_token!
        authenticate_or_request_with_http_token do |token, options|
          @current_user = User.find_by(api_token: token)
        end
      end
      
      def current_user
        @current_user
      end
    end
  end
end 