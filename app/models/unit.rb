# frozen_string_literal: true

class Unit < ApplicationRecord
  belongs_to :condominium

  validates :identifier, presence: true
end
