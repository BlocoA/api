# frozen_string_literal: true

module V1
  class UserSerializer < ApplicationSerializer
    attributes :id, :name, :email
  end
end
