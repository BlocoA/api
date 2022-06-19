# frozen_string_literal: true

module V1
  class ExpenseSerializer < ApplicationSerializer
    attributes :id, :contractee, :amount, :spent_at, :description, :condominium_id
  end
end
