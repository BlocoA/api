# frozen_string_literal: true

module V1
  class CondominiumSerializer < ApplicationSerializer
    attributes :id, :name, :units_quantity, :has_leisure_area
  end
end
