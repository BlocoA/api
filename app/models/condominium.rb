# frozen_string_literal: true

class Condominium < ApplicationRecord
  self.table_name = 'condominiums'

  has_many :condominium_users, dependent: :destroy
  has_many :users, through: :condominium_users
  has_many :units, dependent: :destroy
  has_many :invites, dependent: :destroy
  has_many :documents, dependent: :destroy

  validates :name, presence: true

  def assign_manager(user)
    condominium_user = CondominiumUser.new(user: user, user_role: :manager)
    condominium_users << condominium_user
  end

  def create_initial_units(condominium_id, quantity)
    (1..quantity).each do |index|
      Unit.create!(
        identifier: index.to_s,
        condominium_id: condominium_id
      )
    end
  end

  def manager
    users.where(condominium_users: { user_role: :manager }).first
  end
end
