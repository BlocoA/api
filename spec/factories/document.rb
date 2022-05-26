# frozen_string_literal: true

FactoryBot.define do
  factory :document do
    name { Faker::Name.name }
    month { 1 }
    year { 2022 }
    condominium { build(:condominium) }
    user { build(:user) }
  end
end
