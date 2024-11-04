module Api
  module V2
    class BaseController < ActionController::API
      include ActionController::HttpAuthentication::Token::ControllerMethods
      include Pundit::Authorization

      before_action :authenticate_token!
      after_action :verify_authorized
      after_action :log_activity

      rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
      rescue_from ActiveRecord::RecordNotFound, with: :not_found

      private

      def authenticate_token!
        token = JwtService.decode(token_from_header)
        @current_user = User.find(token['user_id'])
      rescue StandardError
        render json: { error: 'Unauthorized' }, status: :unauthorized
      end

      def token_from_header
        request.headers['Authorization']&.split&.last
      end

      def current_user
        @current_user
      end

      def log_activity
        ActivityLog.create(
          user: current_user,
          action: "#{controller_name}##{action_name}",
          params: request.params.except('controller', 'action'),
          ip_address: request.remote_ip,
          user_agent: request.user_agent,
          status_code: response.status,
          duration: Benchmark.realtime { yield if block_given? }
        )
      end

      def user_not_authorized
        render json: { error: 'Unauthorized' }, status: :forbidden
      end

      def not_found
        render json: { error: 'Resource not found' }, status: :not_found
      end
    end
  end
end 