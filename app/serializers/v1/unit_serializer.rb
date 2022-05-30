# frozen_string_literal: true

module V1
  class UnitSerializer < ApplicationSerializer
    attributes :id, :identifier, :condominium_id
  end
end
