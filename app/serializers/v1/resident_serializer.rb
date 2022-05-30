# frozen_string_literal: true

module V1
  class ResidentSerializer < ApplicationSerializer
    attributes :id, :name, :email, :phone, :unit_id, :user_id
  end
end
