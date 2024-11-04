module Api
  module V1
    class UsersController < BaseController
      def index
        @users = User.all
        render json: @users, each_serializer: UserSerializer
      end

      def show
        @user = User.find(params[:id])
        render json: @user, serializer: UserDetailSerializer
      end

      def create
        @user = User.new(user_params)
        if @user.save
          render json: @user, serializer: UserSerializer, status: :created
        else
          render json: { errors: @user.errors }, status: :unprocessable_entity
        end
      end

      def update
        @user = User.find(params[:id])
        if @user.update(user_params)
          render json: @user, serializer: UserSerializer
        else
          render json: { errors: @user.errors }, status: :unprocessable_entity
        end
      end

      private

      def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, :role)
      end
    end
  end
end 