# frozen_string_literal: true

class Condominium < ApplicationRecord
  self.table_name = 'condominiums'

  has_many :condominium_users, dependent: :destroy
  has_many :users, through: :condominium_users
  has_many :units, dependent: :destroy
  has_many :invites, dependent: :destroy
  has_many :documents, dependent: :destroy

  validates :name, presence: true
end
