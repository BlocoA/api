# frozen_string_literal: true

class Resident < ApplicationRecord
  belongs_to :unit
  belongs_to :user

  validates :name, presence: true
end
