# frozen_string_literal: true

FactoryBot.define do
  factory :invite do
    status { :pending }
    token { SecureRandom.hex }
    expires_at { 2.days.from_now }
    condominium { build(:condominium) }
    user { build(:user) }
  end
end
