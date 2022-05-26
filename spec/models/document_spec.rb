# frozen_string_literal: true

describe Document, type: :model do
  it { is_expected.to belong_to(:condominium) }
  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_one_attached(:file) }
end
