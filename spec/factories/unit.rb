# frozen_string_literal: true

FactoryBot.define do
  factory :unit do
    identifier { '10' }
    condominium { build(:condominium) }
  end
end
