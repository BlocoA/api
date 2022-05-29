# frozen_string_literal: true

module V1
  class UsersController < ApplicationController
    skip_before_action :authenticate_request

    def create
      user = User.new(user_params.merge(password: params[:password]))

      if user.save
        render json: { name: user.name, email: user.email }, status: :created
      else
        errors = user.errors.full_messages.join(', ')
        render json: { errors: errors }, status: :bad_request
      end
    end

    def access_token
      user = authenticate_user

      if user
        token = JsonWebToken.encode(user_id: user.id, exp: 2.months.from_now.to_i)
        render json: { token: token }, status: :ok
      else
        render json: { errors: 'Unauthorized' }, status: :unauthorized
      end
    end

    private

    def user_params
      params.require(:user).permit(:name, :email)
    end

    def authenticate_user
      user = User.find_by(email: params[:email])

      user if user&.authenticate(params[:password])
    end
  end
end
