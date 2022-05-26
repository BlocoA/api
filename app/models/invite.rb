# frozen_string_literal: true

class Invite < ApplicationRecord
  belongs_to :condominium
  belongs_to :user

  enum status: { pending: 0, accepted: 1, expired: 2 }

  before_create :set_token_data

  def expired_token?
    expired! if pending? && (expires_at - Time.zone.now).negative?

    expired? || accepted?
  end

  private

  def set_token_data
    self.token = Digest::SHA256.hexdigest(SecureRandom.hex)
    self.expires_at = 72.hours.from_now
  end
end
