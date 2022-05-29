# frozen_string_literal: true

module Authorizable
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_request
    attr_reader :current_user
  end

  private

  def authenticate_request
    return unauthorized! unless decoded_auth_token

    @current_user ||= User.find_by(id: decoded_auth_token[:user_id])

    return unauthorized! unless @current_user
  end

  def decoded_auth_token
    @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
  end

  def http_auth_header
    authorization_present = request.headers['Authorization'].present?
    return request.headers['Authorization'].split.last if authorization_present

    nil
  end

  def unauthorized!
    render json: { errors: 'Unauthorized' }, status: :unauthorized
  end
end
