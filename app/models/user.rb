# frozen_string_literal: true

class User < ApplicationRecord
  include ActiveModel::SecurePassword
  has_secure_password

  has_many :condominium_users, dependent: :destroy
  has_many :condominiums, through: :condominium_users
  has_many :invites, dependent: :destroy

  validates :name, :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
