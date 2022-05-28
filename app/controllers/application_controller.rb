# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Authenticable

  rescue_from ActiveRecord::RecordNotFound do |error|
    render json: { errors: error.message }, status: :not_found
  end
end
