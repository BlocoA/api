# frozen_string_literal: true

FactoryBot.define do
  factory :condominium do
    name { Faker::Name.name }
    units_quantity { 10 }
    has_leisure_area { true }
  end
end
