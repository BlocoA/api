# frozen_string_literal: true

class User < ApplicationRecord
  include ActiveModel::SecurePassword
  has_secure_password validations: false

  has_many :condominium_users, dependent: :destroy
  has_many :condominiums, through: :condominium_users
  has_many :invites, dependent: :destroy

  validates :name, :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  def self.create_user_associate_condominium(name, email, condominium_id)
    user = User.create!(email: email, name: name)

    CondominiumUser.create!(
      user: user,
      user_role: :resident,
      condominium_id: condominium_id
    )

    user
  end
end
