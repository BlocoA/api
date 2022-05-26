# frozen_string_literal: true

FactoryBot.define do
  factory :resident do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber.cell_phone }
    unit { build(:unit) }
    user { build(:user) }
  end
end
