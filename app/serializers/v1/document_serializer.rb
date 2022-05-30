# frozen_string_literal: true

module V1
  class DocumentSerializer < ApplicationSerializer
    attributes :id, :name, :month, :year, :file_url, :condominium_id, :user_id

    def file_url
      rails_representation_url(object.file)
    end
  end
end
