# frozen_string_literal: true

module V1
  class UsersController < ApplicationController
    def create
      user = User.new(user_params.merge(password: params[:password]))

      if user.save
        render json: { name: user.name, email: user.email }, status: :created
      else
        errors = user.errors.full_messages.join(', ')
        render json: { errors: errors }, status: :bad_request
      end
    end

    private

    def user_params
      params.require(:user).permit(:name, :email)
    end
  end
end
