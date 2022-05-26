# frozen_string_literal: true

FactoryBot.define do
  factory :condominium_user do
    condominium { build(:condominium) }
    user { build(:user) }
    user_role { :manager }
  end
end
