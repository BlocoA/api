# frozen_string_literal: true

describe Condominium, type: :model do
  it { is_expected.to have_many(:condominium_users) }
  it { is_expected.to have_many(:users).through(:condominium_users) }
  it { is_expected.to have_many(:units) }
  it { is_expected.to have_many(:invites) }

  it { is_expected.to validate_presence_of(:name) }
end
