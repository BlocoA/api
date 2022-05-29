# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Authorizable

  rescue_from ActiveRecord::RecordNotFound do |error|
    render json: { errors: error.message }, status: :not_found
  end
end
