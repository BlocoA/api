# frozen_string_literal: true

class Condominium < ApplicationRecord
  self.table_name = 'condominiums'

  validates :name, presence: true
end
