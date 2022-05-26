# frozen_string_literal: true

class Unit < ApplicationRecord
  belongs_to :condominium
  has_many :residents, dependent: :destroy

  validates :identifier, presence: true
end
