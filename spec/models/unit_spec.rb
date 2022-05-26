# frozen_string_literal: true

describe Unit, type: :model do
  it { is_expected.to belong_to(:condominium) }
  it { is_expected.to have_many(:residents) }

  it { is_expected.to validate_presence_of(:identifier) }
end
