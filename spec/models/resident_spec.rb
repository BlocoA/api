# frozen_string_literal: true

describe Resident, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:unit) }

  it { is_expected.to validate_presence_of(:name) }
end
