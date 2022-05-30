# frozen_string_literal: true

class ApplicationSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  default_url_options[:host] = ENV.fetch('BASE_URL', 'localhost:3000')
end
